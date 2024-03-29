// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allNewsNWModel = try? JSONDecoder().decode(AllNewsNWModel.self, from: jsonData)

import Foundation

// MARK: - WeatherNetwModel
struct WeatherNetwModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int?
    let pop: Double
    let sys: Sys
    let dtTxt: String
    let rain, snow: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain, snow
    }
    var dayStr: String{
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let df = DateFormatter()
        df.dateFormat = "dd.MM"
        return df.string(from: date)
    }

    var hStr:String{
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let df = DateFormatter()
        df.dateFormat = "HH"
        return df.string(from: date)
    }

}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: MainEnum
    let description, icon: String
    
    var urlStrIcon: String{
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

