//
//  MapKitViewController.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 15/06/22.
//
import CoreLocation
import UIKit
import MapKit

class MapKitViewController: UIViewController {
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {return}
                
                let pin = MKPointAnnotation()
                pin.coordinate = location.coordinate
                strongSelf.map.setRegion(
                    MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan.init(
                            latitudeDelta: 0.7,
                            longitudeDelta: 0.7) ),
                        animated: true)
                strongSelf.map.addAnnotation(pin)
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
 
