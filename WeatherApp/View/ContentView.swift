//
//  ContentView.swift
//  WeatherApp
//
//  Created by Никита Попов on 13.03.24.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var currentWeatherData : WeatherNetwModel?
    @ObservedObject var model = HomeViewModel()
    @State private var cityText = ""
    
    var body: some View {
        VStack (alignment: .leading){
            if let currentData = model.dailyWeatherData{
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Text(currentData.city.name).font(.title2.bold())
                        Text(currentData.city.country)
                    }
                    Button(action: {
                        model.getLocationWeather()
                    }, label: {
                        Image(systemName: "location")
                    })
                    Spacer()
                    SearchBar(text: $cityText)
                        .onChange(of: cityText) { oldValue, newValue in
                            model.currentCity = cityText
                        }
                }
                Spacer()
                if let currentWeather = model.currentWeatherData{
                    if let urlStr = currentWeather.weather.first?.urlImage {
                        AsyncImage(url: URL(string: urlStr))
                    }
                    CurrentTempCard(currentWeather: currentWeather)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    DailyWeatherScroll(weatherData: currentData)
                }.frame(maxWidth: .infinity, maxHeight: 100)
            }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        
    }
}

#Preview {
    ContentView()
}




