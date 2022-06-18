//
//  LocationManager.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 15/06/22.
//
import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    var completion: ((CLLocation) -> Void)?
    static var currentLocation: CLLocation?
    
    public func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        LocationManager.currentLocation = location
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
}

class LocationManagerAnnotation {
    
}
