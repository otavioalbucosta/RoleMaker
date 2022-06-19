//
//  SheetViewController.swift
//  RoleMaker
//
//  Created by Cicero Nascimento on 13/06/22.
//

import UIKit

class SheetViewController: UIViewController {

    let sheetCard = CardsTableViewController()
//    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        
        
     
//        label.text = "PinkSheet"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(label)
        sheetCard.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sheetCard.view)
        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        sheetCard.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant:16.0).isActive = true
        sheetCard.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
        sheetCard.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        sheetCard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
        
//        NSLayoutConstraint.activate([
//            sheetCard.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            sheetCard.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }

}
