//
//  CharView.swift
//  WeatherApp
//
//  Created by Никита Попов on 15.03.24.
//

import SwiftUI
import Charts

struct CharView: View {
    var data:[TempCharData]
    
    var body: some View {
        VStack{
            Chart{
                ForEach(data){ item in
                    AreaMark(x: .value("Date", item.date), y: .value("Temp", item.temp))
                        .symbol(.circle)
                }
            }.padding()
                .background(.white.opacity(0.2))
                .clipShape(.rect(cornerRadius: 30))
            .foregroundStyle(LinearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .top, endPoint: .bottom))
            .padding()
            .chartYAxis(.visible)
            .chartYAxisLabel(position: .topLeading){
                Text("tº").foregroundStyle(.white)
            }
            .chartXAxis(.visible)
            .chartXAxisLabel (position: .bottomTrailing){
                Text("Date").foregroundStyle(.white)
            }
            .chartXAxis {
                AxisMarks{_ in
                    AxisValueLabel()
                        .foregroundStyle(.clear)
                }
            }
            .chartYAxis {
                AxisMarks{_ in
                    AxisValueLabel()
                        .foregroundStyle(.white)
                }
            }
        }
        .clipShape(.rect(cornerRadius: 30))
        .background(.black)
    }
}

#Preview {
    ContentView()
}

