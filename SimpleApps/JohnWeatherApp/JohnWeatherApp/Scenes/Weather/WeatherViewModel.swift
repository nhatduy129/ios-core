//
//  WeatherViewModel.swift
//  JohnWeatherApp
//
//  Created by Macbook on 12/03/2023.
//

import WeatherKit
import Combine
import CoreLocation

final class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var cityName: String?
    private let weatherService: WeatherService
    private let locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()
    private let geocoder = CLGeocoder()

    init(weatherService: WeatherService = WeatherService(),
         locationManager: LocationManager = LocationManager()) {
        self.weatherService = weatherService
        self.locationManager = locationManager
        locationManager.$currentLocation
            .compactMap { $0 }
            .sink { [weak self] location in
            print("xyz sink", location)
            guard let self = self else { return }
            Task {
                await self.fetchWeather(for: location)
            }
        }
        .store(in: &cancellables)
    }

    func fetchWeather(for location: CLLocation) async {
        do {
            let weather =  try await weatherService.weather(for: location)
            let cityName = try await geocoder.reverseGeocodeLocation(location).first?.locality
            DispatchQueue.main.async {
                self.weather = weather
                self.cityName = cityName
            }
        } catch {
            print(error)
        }
    }
}
