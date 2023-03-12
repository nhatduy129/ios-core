//
//  ContentView.swift
//  JohnWeatherApp
//
//  Created by Macbook on 11/03/2023.
//

import SwiftUI
import WeatherKit
import CoreLocation
import Charts

struct TenDayForcastView: View {
    let dayWeatherList: [DayWeather]

    var body: some View {
        VStack(alignment: .leading) {
            Text("10-DAY FORECAST")
                .font(.caption)
                .opacity(0.5)
            List(Array(dayWeatherList.enumerated()), id: \.1.date) { (index, dailyWeather) in
                VStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .fill(Color(hex: 0xDCDCDC))
                        .frame(height: 0.5)
                    Spacer()
                    HStack {
                        let dateLabel: String = index == 0 ? "Today" : dailyWeather.date.formatAsAbbreviatedDay()
                        Text(dateLabel)
                            .frame(maxWidth: 70, alignment: .leading)
                            .bold()
                        Image(systemName: "\(dailyWeather.symbolName).fill")
                        Text(dailyWeather.lowTemperature.formatted().dropLast())
                            .frame(maxWidth: .infinity)
                            .bold()
                            .foregroundColor(Color(hex: 0xDCDCDC))
                        Text(dailyWeather.highTemperature.formatted().dropLast())
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .bold()
                    }
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(.zero))
            }
            .listStyle(PlainListStyle())
            .frame(height: CGFloat(dayWeatherList.count) * 44)
        }
        .padding()
        .background(content: {
            Color(hex: 0x7B6DD2)
        })
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .foregroundColor(.white)
    }
}

struct WeatherView: View {
    let weatherService = WeatherService.shared
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?
    @State private var cityName: String = "_"

    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
        } else {
            return []
        }
    }

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }.edgesIgnoringSafeArea(.all)
            VStack {
                if let weather {
                    VStack {
                        Text(cityName)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("\(weather.currentWeather.temperature.formatted())")
                            .foregroundColor(.white)
                    }
                    TenDayForcastView(dayWeatherList: weather.dailyForecast.forecast)
                    Spacer()
                }
            }
            .padding()
            .task(id: locationManager.currentLocation) {
                do {
                    if let location = locationManager.currentLocation {
                        self.weather =  try await weatherService.weather(for: location)
                        let geocoder = CLGeocoder()
                        geocoder.reverseGeocodeLocation(location) { placemarks, error in
                            if error == nil {
                                if let firstLocation = placemarks?[0],
                                   let cityName = firstLocation.locality {
                                    self.cityName = cityName
                                }
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
