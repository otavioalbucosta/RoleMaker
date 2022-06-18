//
//  Place.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 08/06/22.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

struct Place: Codable {
    let place_id: String
    let name: String
    let vicinity: String
    let geometry: GeometryPlace
   let price_level: Int?
    let rating: Double
    let types: [String]
    let photos: [PlacePhoto]
    
    func toPlaceAnnotation() -> PlaceAnnotation {
        return PlaceAnnotation(self.geometry.location.lat, self.geometry.location.lng, title: name, subtitle: vicinity)
    }
}

struct GeometryPlace: Codable {
    let location: Location
    let viewport: Bounds
    struct Location: Codable {
        let lat: Double
        let lng: Double
    }
    struct Bounds: Codable {
        let northeast: Location
        let southwest: Location
    }
}
