//
//  SheetViewController.swift
//  RoleMaker
//
//  Created by Cicero Nascimento on 13/06/22.
//

import UIKit

class SheetViewController: UIViewController {

    let sheetCard = CardsTableViewController()
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        view.addSubview(sheetCard)
        label.text = "PinkSheet"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }



}
