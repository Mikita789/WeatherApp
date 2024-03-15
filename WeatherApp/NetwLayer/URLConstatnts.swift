//
//  URLConstatnts.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import Foundation
import CoreLocation

enum URLWeather{
    case threeDays
    case current
    case currentLocation
    
    func createURLLocationWeather(_ coord: CLLocationCoordinate2D) -> URL?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = [URLQueryItem(name: "lat", value: "\(coord.latitude)"),
                                 URLQueryItem(name: "lon", value: "\(coord.longitude)"),
                                 URLQueryItem(name: "appid", value: "a9a0b74f3e9fa3791aba58556db76d6f"),
                                 URLQueryItem(name: "units", value: "metric")
        ]
        print(components.url)
        return components.url
    }
    
    
    func createURL(_ city: String)->URL?{
        var components = URLComponents()
        
        ///https://api.openweathermap.org/data/2.5/weather?q=city&appid=a9a0b74f3e9fa3791aba58556db76d6f&units=metric
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        switch self{
            
        case .threeDays:
            components.path = "/data/2.5/forecast"
        case .current, .currentLocation:
            components.path = "/data/2.5/weather"
            
        }
        
        components.queryItems = [URLQueryItem(name: "q", value: city),
                                 URLQueryItem(name: "appid", value: "a9a0b74f3e9fa3791aba58556db76d6f"),
                                 URLQueryItem(name: "units", value: "metric")
        ]
        
        return components.url
    }
}
