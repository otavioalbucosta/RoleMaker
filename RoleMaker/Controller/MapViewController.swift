//
//  MapKitViewController.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 15/06/22.
//
import CoreLocation
import UIKit
import MapKit

class MapKitViewController: UIViewController, MKMapViewDelegate {
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard !annotation.isKind(of: MKUserLocation.self) else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "")
            annotationView.tintColor = .red
            annotationView.displayPriority = .defaultHigh
            annotationView.isHighlighted = true
            return annotationView
        }
        guard let annotation = annotation as? PlaceAnnotation else {return nil}

        if let dequedView = map.dequeueReusableAnnotationView(withIdentifier: "") as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "")
        }
        annotationView.canShowCallout = true
        annotationView.markerTintColor = .brown
        annotationView.displayPriority = .required
        
        return annotationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.delegate = self
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {return}
                let pin = MKPointAnnotation()
                pin.coordinate = location.coordinate
                strongSelf.map.setRegion(
                    MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan.init(
                            latitudeDelta: 0.4,
                            longitudeDelta: 0.4) ),
                        animated: true)
                strongSelf.map.addAnnotation(pin)
                PlacesAPIManager.shared.getNearbyPlacesByType(location: LocationManager.currentLocation!, type: "restaurant", radius: 1000) { places in
                    print(places)
                    let placeAnnotation = places.map({ Place in
                        return Place.toPlaceAnnotation()
                    })
                    print(placeAnnotation)
                    strongSelf.map.addAnnotations(placeAnnotation)
                
                }
                
                
                
                
            }
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 
