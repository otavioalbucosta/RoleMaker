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
    
    let buttonFinalRole = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))

//    buttonFinalRole;.backgroundColor = .systemBlue
    
    let nv = FinalRoleViewController()
    @objc func buttonAction(sender: UIButton!) {
        show(nv, sender: self)
    }
    
    var image = UIImageView(image: UIImage(systemName: "minus"))


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        
        
        //MARK: config button
        buttonFinalRole.setTitle(" Criar rota ", for: .normal)
//        buttonFinalRole.tintColor = .sys
        buttonFinalRole.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonFinalRole.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)
        buttonFinalRole.layer.cornerRadius = 8
//        buttonFinalRole.setTitleColor(.black, for: .normal)
//        buttonFinalRole.layer.borderWidth = 1
        
        
        //MARK: addviews
        view.addSubview(sheetCard.view)
        view.addSubview(buttonFinalRole)
        view.addSubview(image)
        
        //MARK: translateAutoresizingMask
        sheetCard.view.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        buttonFinalRole.translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK: constraints
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        buttonFinalRole.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -23).isActive = true
//        buttonFinalRole.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonFinalRole.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
        
        sheetCard.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant:16.0).isActive = true
        sheetCard.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sheetCard.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        sheetCard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
        
    }
}


