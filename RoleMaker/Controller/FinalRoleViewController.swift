//
//  FinalRoleViewController.swift
//  RoleMaker
//
//  Created by Cicero Nascimento on 23/06/22.
//

import UIKit
import MapKit
import CoreLocation

class FinalRoleViewController: UIViewController, MKMapViewDelegate {
    
    var startPlace: Place? = nil
    var midPlace: Place? = nil
    var endPlace: Place? = nil
    
    let finalCard = FinalTableViewController()
    
    
    let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        finalCard.startPlace = startPlace
        finalCard.midPlace = midPlace
        finalCard.endPlace = endPlace
        view.addSubview(map)
        view.addSubview(finalCard.view)
        
        map.delegate = self
        let text = UILabel()
        
        text.text = "teste"
        
        view.backgroundColor =  UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
//        view.backgroundColor = .white
        
        finalCard.view.translatesAutoresizingMaskIntoConstraints = false
        
//        finalCard.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        finalCard.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        finalCard.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
//        finalCard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        finalCard.view.widthAnchor.constraint(equalToConstant: 370).isActive = true
        finalCard.view.heightAnchor.constraint(equalToConstant: 290).isActive = true
        
        
//        text.translatesAutoresizingMaskIntoConstraints = false
//        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Do any additional setup after loading the view.
        calculateRoute()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func calculateRoute() {
        let startMark = MKMapItem(placemark: MKPlacemark(coordinate: (startPlace!.toPlaceAnnotation().coordinate)))
        let startPoint = MKPointAnnotation()
        startPoint.coordinate = (startPlace!.toPlaceAnnotation().coordinate)
        startPoint.title = startPlace?.name
        
        let midMark = MKMapItem(placemark: MKPlacemark(coordinate: (midPlace!.toPlaceAnnotation().coordinate)))
        let midPoint = MKPointAnnotation()
        midPoint.coordinate = (midPlace!.toPlaceAnnotation().coordinate)
        midPoint.title = midPlace?.name
        
        let endMark = MKMapItem(placemark: MKPlacemark(coordinate: (endPlace!.toPlaceAnnotation().coordinate)))
        let endPoint = MKPointAnnotation()
        endPoint.coordinate = (endPlace!.toPlaceAnnotation().coordinate)
        endPoint.title = endPlace?.name
        
        
        let directionStartMid = MKDirections.Request()
        directionStartMid.source = startMark
        directionStartMid.destination = midMark
        directionStartMid.transportType = .automobile
        
        let directionMidEnd = MKDirections.Request()
        directionStartMid.source = midMark
        directionStartMid.destination = endMark
        directionStartMid.transportType = .automobile

        
        self.map.showAnnotations([startPoint, midPoint, endPoint], animated: true)
        
        let dirSM = MKDirections(request: directionStartMid)
        let dirME = MKDirections(request: directionMidEnd)
        
        dirSM.calculate { res, error in
            guard let res = res else {
                if let error = error {
                    print("Error found: \(error)")
                }
                return
            }
            let route = res.routes[0]
            self.map.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
            
            
        }
        dirME.calculate { res, error in
            guard let res = res else {
                if let error = error {
                    print("Error found: \(error)")
                }
                return
            }
            let route = res.routes[0]
            self.map.addOverlay(route.polyline, level: MKOverlayLevel.aboveLabels)
            
            
        }
//        let rect = route.polyline.boundingMapRect
//        self.map.setRegion(MKCoordinateRegion(rect, animated: true)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 390, height: 450))
//        map.layer.cornerRadius = 25
//        map.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

}


extension FinalRoleViewController {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 5
        renderer.strokeColor = .systemYellow
        
        return renderer
    }
    
    
}
