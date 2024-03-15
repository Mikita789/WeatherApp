//
//  CurrentWeatherNetwModel.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import Foundation


// MARK: - CurrentWeatherNetwModel
struct CurrentWeatherNetwModel: Codable {
    let coord: Coord
    let weather: [WeatherCurr]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Syst
    let timezone, id: Int
    let name: String
    let cod: Int
}


// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
    
    var tempCurr:String{
        return String(Int(temp))
    }
    var tempFeels:String{
        return String(Int(feelsLike))
    }
    var tempMinStr:String{
        return String(Int(tempMin))
    }
    var tempMaxStr:String{
        return String(Int(tempMax))
    }
}

// MARK: - Sys
struct Syst: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct WeatherCurr: Codable {
    let id: Int
    let main, description, icon: String
    
    var urlImage:String{
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
}

