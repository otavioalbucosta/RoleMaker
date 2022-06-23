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
        
        card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        card.heightAnchor.constraint(equalTo: heightAnchor, constant: -20).isActive = true
        card.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        card.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        
        
        chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        chooseLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        chooseLabel.font = .preferredFont(forTextStyle: .title2)
        chooseLabel.numberOfLines = 0
        chooseLabel.textAlignment = .center
        chooseLabel.text = "O que você quer fazer\n antes do evento?"
        card.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        
    }

    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var card: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
