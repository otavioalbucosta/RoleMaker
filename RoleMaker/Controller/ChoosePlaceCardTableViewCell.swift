//
//  ChoosePlaceCardTableViewCell.swift
//  RoleMaker
//
//  Created by Cicero Nascimento on 21/06/22.
//

import UIKit

class ChoosePlaceCardTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        card.clipsToBounds = false
        card.layer.cornerRadius = 15
        card.backgroundColor = UIColor.white
        
        card.translatesAutoresizingMaskIntoConstraints = false
        chevron.translatesAutoresizingMaskIntoConstraints = false
        
        chevron.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        chevron.heightAnchor.constraint(equalTo: heightAnchor, constant: -20).isActive = true
        chevron.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        chevron.tintColor = .gray


        card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        card.heightAnchor.constraint(equalTo: heightAnchor, constant: -20).isActive = true
        card.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        card.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.1
        card.layer.shadowOffset.height =  6
        card.layer.shadowRadius = 5
        
        chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        chooseLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        chooseLabel.centerXAnchor.constraint(equalTo: leftAnchor, constant: 170).isActive = true
        chooseLabel.textAlignment = .center
        chooseLabel.textColor = .gray
        chooseLabel.font = .preferredFont(forTextStyle: .headline)
        chooseLabel.text = "Selecione o local antes do evento?"
        card.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        
        
        
    }

    @IBOutlet weak var chevron: UIImageView!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var card: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
