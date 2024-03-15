//
//  DailyWeatherScroll.swift
//  WeatherApp
//
//  Created by Никита Попов on 15.03.24.
//

import SwiftUI

struct DailyWeatherScroll: View {
    var weatherData: WeatherNetwModel
    var body: some View {
        HStack{
            ForEach(weatherData.list, id: \.dtTxt){item in
                VStack{
                    Text(item.dayStr)
                    Text("\(item.hStr):00")
                    HStack{
                        Text("\(Int(item.main.tempMax))º")
                        if let iconURL = item.weather.first?.urlStrIcon{
                            AsyncImage(url: URL(string: iconURL)){image in
                                if let image = image.image{
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                }
                            }
                        }else {
                            Rectangle()
                                .frame(width: 30, height: 30)
                        }
                        
                    }
                }.padding()
                    .background(.white.opacity(0.1))
                    .clipShape(.capsule)
            }
        }
    }
}
