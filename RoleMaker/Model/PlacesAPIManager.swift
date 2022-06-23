//
//  PlacesAPIManager.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 17/06/22.
//

import Foundation
import CoreLocation


struct PlacesAPIManager {
    
    struct PlaceResponse: Codable {
        var html_attributions: [String]
        var results: [Place]
    }
    
    static let shared = PlacesAPIManager()
    let apiKey = "AIzaSyCIdjzHIaOmkS6eKWvkOz5RmmNdN5H34YY"
    
    
    func getNearbyPlacesByType(location: CLLocation, type: String, radius: Int, completion: @escaping ([Place])->()) {
        var url = URLComponents(string:"https://maps.googleapis.com/maps/api/place/nearbysearch/json")!
        
        url.queryItems = [
            URLQueryItem(name: "location", value: "\(location.coordinate.latitude),\(location.coordinate.longitude)"),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "radius", value: "\(radius)"),
            URLQueryItem(name:"key", value: apiKey)
        ]
        var places: [Place]?
        
        URLSession.shared.dataTask(with: url.url!) { data, response, error in
            if let data = data {
                do {
                    print(url.url!)
                let placeResponse = try JSONDecoder().decode(PlaceResponse.self, from: data)
                    places = placeResponse.results
                    completion(places!)
                }catch {
                    print(error)
                }
            }
                
            }.resume()
    }
}
