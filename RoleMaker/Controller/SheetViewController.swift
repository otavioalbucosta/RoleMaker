//
//  SheetViewController.swift
//  RoleMaker
//
//  Created by Cicero Nascimento on 13/06/22.
//

import UIKit
import Foundation



class SheetViewController: UIViewController {

    let sheetCard = CardsTableViewController()
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
    
    var image = UIImageView(image: UIImage(systemName: "minus"))
    
//    let yellowSquare: UIView = {
//        var view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        view.backgroundColor = .yellow
//        return view
//    }()
//
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        view.addSubview(image)
        
        
        sheetCard.view.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sheetCard.view)

        
//        image.widthAnchor.constraint(equalToConstant: 75).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
        sheetCard.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant:16.0).isActive = true
        sheetCard.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 15.0).isActive = true
        sheetCard.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        sheetCard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
        
//        view.addSubview(yellowSquare)
        
        
//
//        yellowSquare.center = CGPoint(x: yellowSquare.bounds.size.width/2, y: yellowSquare.bounds.size.height/2)
    
      
        

    }
}
