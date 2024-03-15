//
//  TempCard.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import SwiftUI

struct CurrentTempCard: View {
    var currentWeather: CurrentWeatherNetwModel
    var body: some View {
        VStack(alignment: .leading){
            Text("\(currentWeather.main.tempCurr)º").font(.system(size: 70, weight: .ultraLight))
            HStack{
                Text("min").foregroundStyle(.secondary)
                Text("\(currentWeather.main.tempMinStr)º")
                Text("max").foregroundStyle(.secondary)
                Text("\(currentWeather.main.tempMaxStr)º")
            }
            Text("Feels like \(currentWeather.main.tempFeels)º")
            
        }.foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
