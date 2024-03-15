//
//  TempCharData.swift
//  WeatherApp
//
//  Created by Никита Попов on 15.03.24.
//

import Foundation


struct TempCharData: Identifiable{
    let id = UUID()
    let date: String
    let temp: Int
}
