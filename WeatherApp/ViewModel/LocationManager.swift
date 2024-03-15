//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Никита Попов on 14.03.24.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let locManager = CLLocationManager()
    @Published var coordinates:CLLocationCoordinate2D?
    
    override init(){
        super .init()
        locManager.delegate = self
        locManager.startUpdatingLocation()
        locManager.requestWhenInUseAuthorization()
    }
    
    func getCoord(){
        locManager.startUpdatingLocation()
        locManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.coordinates = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("DEBUG: - Error Location Manager")
    }
    
    func cityByCoord(coord: CLLocationCoordinate2D, compl: @escaping (String?) -> (Void)){
        let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        CLGeocoder().reverseGeocodeLocation(location) { place, err in
            guard let place = place?.first, err == nil else {
                compl(nil)
                return
            }
            if let city = place.locality{
                compl(city)
            }else{
                compl(nil)
            }
        }
    }
}
