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
        return PlaceAnnotation(self.geometry.location.lat, self.geometry.location.lng, title: name, subtitle: vicinity, id: place_id)
    }
}

struct GeometryPlace: Codable {
    let location: Location
}
struct Location: Codable {
    let lat: Double
    let lng: Double
}


extension Place {
    #if DEBUG
    static func mock() -> [Place] {
        var places: [Place] = []
        places.append(Place(place_id: "ChIJT9wQXv1IxwcR-WMIWjBO7RY", name: "Boteco do Arlindo", vicinity: "Rua Carlos Gomes, 83 - José Bonifacio, Fortaleza", geometry: GeometryPlace(location: Location(lat: -3.7415457 ,lng: -38.5267982)), price_level: 2, rating: 4.3, types: [ "bar", "restaurant", "point_of_interest", "food", "establishment" ], photos: [PlacePhoto(height: 900, width: 1350, photo_reference: "Aap_uEDLOFt4y-J3CMzmVRs-SzwKcE7J44U2MHnkr--ADNOno2Mn0y82FH-ZWjDul8B7rVsJQIC4ctJl9MlDwXxLVUp7EjmMUo6K3QH4pkXNo3j56ogjdYXGkvDyKk0JPUSzmz9ihRAhzyA4iYUoVmd30INquAnG9CVB4a7F961e6x_sdyJz", html_attributions: [
            "\\u003ca href=\"https://maps.google.com/maps/contrib/114727320476039103791\"\\u003eThe Little Snail Restaurant\\u003c/a\\u003e"
         ])]))
        
        places.append(Place(place_id: "ChIJGVS6ABBJxwcRoNeTujPud1Y", name: "Barbarians Pub", vicinity: "Rua Waldery Uchôa, 42 - Benfica, Fortaleza", geometry: GeometryPlace(location: Location(lat: -33.870383 ,lng: 151.1979245)), price_level: 2, rating: 4.4, types: [ "bar", "restaurant", "point_of_interest", "food", "establishment" ], photos: [PlacePhoto(height: 900, width: 1350, photo_reference: "Aap_uEDLOFt4y-J3CMzmVRs-SzwKcE7J44U2MHnkr--ADNOno2Mn0y82FH-ZWjDul8B7rVsJQIC4ctJl9MlDwXxLVUp7EjmMUo6K3QH4pkXNo3j56ogjdYXGkvDyKk0JPUSzmz9ihRAhzyA4iYUoVmd30INquAnG9CVB4a7F961e6x_sdyJz", html_attributions: [
            "\\u003ca href=\"https://maps.google.com/maps/contrib/114727320476039103791\"\\u003eThe Little Snail Restaurant\\u003c/a\\u003e"
         ])]))
        
        places.append(Place(place_id: "ChIJG4fyFhVJxwcRvmwn4KAtpIA", name: "Culinária da Van", vicinity: "Rua Waldery Uchôa, 260 - Benfica, Fortaleza", geometry: GeometryPlace(location: Location(lat: -3.7441239 ,lng: -38.5391313)), price_level: 2, rating: 4.5, types: [
            "bar",
            "spa",
            "lodging",
            "restaurant",
            "food",
            "point_of_interest",
            "establishment"
         ], photos: [PlacePhoto(height: 900, width: 1350, photo_reference: "Aap_uEDLOFt4y-J3CMzmVRs-SzwKcE7J44U2MHnkr--ADNOno2Mn0y82FH-ZWjDul8B7rVsJQIC4ctJl9MlDwXxLVUp7EjmMUo6K3QH4pkXNo3j56ogjdYXGkvDyKk0JPUSzmz9ihRAhzyA4iYUoVmd30INquAnG9CVB4a7F961e6x_sdyJz", html_attributions: [
            "\\u003ca href=\"https://maps.google.com/maps/contrib/114727320476039103791\"\\u003eThe Little Snail Restaurant\\u003c/a\\u003e"
         ])]))
        return places
    }
    #endif
}
