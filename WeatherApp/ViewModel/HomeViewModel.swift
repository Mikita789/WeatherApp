//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import Foundation
import CoreLocation

@MainActor
class HomeViewModel: ObservableObject{
    private var netwManager = NetwManager.shared
    private let locManager = LocationManager()
    
    @Published var dailyWeatherData: WeatherNetwModel?
    @Published var currentWeatherData: CurrentWeatherNetwModel?
    @Published var currentCity: String = ""{
        didSet{
            Task{
                self.dailyWeatherData = try await netwManager.getDailyWeatherInfo(currentCity)
                self.currentWeatherData = try await netwManager.getCurrentWeatherData(currentCity)
            }
        }
    }
    
    init() {
        Task{
            if let coord = self.getCoord(){
                locManager.cityByCoord(coord: coord){ res in
                    self.currentCity = res ?? "Minsk"
                }
            }
            self.dailyWeatherData = try await netwManager.getDailyWeatherInfo(currentCity)
            self.currentWeatherData = try await netwManager.getCurrentWeatherData(currentCity)
        }
    }
    func getLocationWeather(){
        Task{
            if let coord = self.getCoord(){
                locManager.cityByCoord(coord: coord){ [weak self] res in
                    self?.currentCity = res ?? ""
                }
                let data = try await netwManager.getCurrentLocationWeather(coord)
                self.currentWeatherData = data
            }
        }
    }
    
    func getCoord() -> CLLocationCoordinate2D?{
        locManager.getCoord()
        if let coord = locManager.coordinates{
            return coord
        }else {
            return nil
        }
    }
}
