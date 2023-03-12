//
//  ContentView.swift
//  JohnWeatherApp
//
//  Created by Macbook on 11/03/2023.
//

import SwiftUI
import WeatherKit

struct TenDayForcastView: View {
    let dayWeatherList: [DayWeather]
    @Binding var selectedSummary: String
    @Binding var showSheet: Bool

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
                .onTapGesture {
                    // selectedSummary = dailyWeather  // TODO: I want to get summary from dailyWeather object here
                    selectedSummary = "I stuck here"
                    showSheet = true
                }
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
    @ObservedObject var viewModel = WeatherViewModel()
    @State var selectedSummary: String = ""
    @State var showSheet: Bool = false

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }.edgesIgnoringSafeArea(.all)
            VStack {
                if let weather = viewModel.weather, let cityName = viewModel.cityName {

                    VStack {
                        Text(cityName)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("\(weather.currentWeather.temperature.formatted())")
                            .foregroundColor(.white)
                    }
                    TenDayForcastView(dayWeatherList: weather.dailyForecast.forecast,
                                      selectedSummary: $selectedSummary,
                                      showSheet: $showSheet)
                    Spacer()
                } else {
                    ProgressView("Loading...")
                        .foregroundColor(.white)
                        .tint(.white)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading) {
                Text("Daily Summary")
                    .font(.title2)
                    .padding(.bottom, 10)
                Text(selectedSummary)
                    .presentationDetents([.fraction(0.4)])
                Spacer()
            }.padding()
        }
    }
}
