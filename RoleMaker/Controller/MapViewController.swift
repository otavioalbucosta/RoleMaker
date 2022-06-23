//
//  MapKitViewController.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 15/06/22.
//
import CoreLocation
import UIKit
import MapKit

protocol MapKitViewControllerDelegate {
    func addPlace(place: Place, cellNumber: Int)
}

class MapKitViewController: UIViewController, MKMapViewDelegate{
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    var delegate: MapKitViewControllerDelegate?
    var cellnum: Int?
    
    private var currentLocation: CLLocation? = nil {
        didSet{
            if let currentLocation = currentLocation {
                let pin = LocationManager.shared.toLocationManagerAnnotation()
                self.map.setRegion(
                    MKCoordinateRegion(
                        center: currentLocation.coordinate,
                        span: MKCoordinateSpan.init(
                            latitudeDelta: 0.1,
                            longitudeDelta: 0.1) ),
                        animated: true)
                self.map.addAnnotation(pin)
            }
        }
    }
    
    private var places: [Place] = []{
        didSet {
            let placeAnnotation = places.map{ Place in
                return Place.toPlaceAnnotation()
            }
            self.map.addAnnotations(placeAnnotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation =  view.annotation as? LocationManagerAnnotation {
            return
        }
        let placeAnnotation = view.annotation as! PlaceAnnotation
        delegate?.addPlace(place: places.first {
            $0.place_id == placeAnnotation.place_id
        }!, cellNumber: cellnum!)
        self.dismiss(animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        if let annotation = annotation as? LocationManagerAnnotation {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "")
            annotationView.markerTintColor = .blue
            annotationView.displayPriority = .required
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
        annotationView.titleVisibility = .adaptive
        
        return annotationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.delegate = self
        LocationManager.shared.getUserLocation { [weak self] location in
            guard let strongSelf = self else {return}
            strongSelf.currentLocation = location
            print("foi2")
            PlacesAPIManager.shared.getNearbyPlacesByType(location: LocationManager.currentLocation!, type: "restaurant", radius: 1000) { places in
                self?.places = places
                print("foi1")
            }
        }
        
        
        print("foi3")
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
 
