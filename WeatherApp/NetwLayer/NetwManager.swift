//
//  NetwManager.swift
//  WeatherApp
//
//  Created by Никита Попов on 13.03.24.
//

import Foundation
import CoreLocation

struct NetwManager{
    static let shared = NetwManager()
    private init(){}
    
    private func parseDateV2<T: Codable>(data: Data, to type: T.Type) throws -> T{
        let decoder = JSONDecoder()
        do{
            let res = try decoder.decode(T.self, from: data)
            return res
        }catch{
            let err = UserErrors.parseErr
            print(err.rawValue)
            throw err
        }
    }
    
    func getCurrentWeatherData(_ city: String) async throws -> CurrentWeatherNetwModel{
        guard let url = URLWeather.current.createURL(city) else {
            let err = UserErrors.badURL
            print(err.rawValue)
            throw err
        }
        let (res, _) = try await URLSession.shared.data(from: url)
        let parseRes = try self.parseDateV2(data: res, to: CurrentWeatherNetwModel.self)
        return parseRes
    }
    
    func getCurrentLocationWeather(_ coord: CLLocationCoordinate2D) async throws -> CurrentWeatherNetwModel{
        guard let url = URLWeather.currentLocation.createURLLocationWeather(coord) else {
            let err = UserErrors.badURL
            print(err.rawValue)
            throw err
        }
        print(url)
        let (res, _) = try await URLSession.shared.data(from: url)
        let parseRes = try self.parseDateV2(data: res, to: CurrentWeatherNetwModel.self)
        return parseRes
    }
    
    func getDailyWeatherInfo(_ city:String) async throws -> WeatherNetwModel {
        guard let url = URLWeather.threeDays.createURL(city) else {
            let err = UserErrors.badURL
            print(err.rawValue)
            throw err
        }
        let (res, _) = try await URLSession.shared.data(from: url)
        let result = try parseDateV2(data: res, to: WeatherNetwModel.self)
        return result
    }
}
