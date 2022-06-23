//
//  PlaceAnnotation.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 17/06/22.
//

import Foundation
import MapKit
import CoreLocation

class PlaceAnnotation: NSObject, MKAnnotation {
    let place_id: String
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees, title: String, subtitle: String, id: String) {
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.place_id = id
    }
    
}
