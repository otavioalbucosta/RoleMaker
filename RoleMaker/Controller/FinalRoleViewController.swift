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
    
    
    let finalCard = CardsTableViewController()
    
    let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 390, height: 450))
//        map.layer.cornerRadius = 25
//        map.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

}
