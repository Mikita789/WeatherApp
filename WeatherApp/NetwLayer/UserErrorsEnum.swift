//
//  UserErrorsEnum.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import Foundation


enum UserErrors: String, Error{
    case badURL = "bad URL adress"
    case noData = "no Data"
    case parseErr = "Error Parse"
}
