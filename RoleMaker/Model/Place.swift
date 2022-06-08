//
//  Place.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 08/06/22.
//

import Foundation
import UIKit

struct Place: Codable {
    let place_id: String
    let name: String
    let vicinity: String
    let place: GeometryPlace
    let price_level: Int
    let rating: Double
    let types: [String]
    let photo: PlacePhoto
    
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
