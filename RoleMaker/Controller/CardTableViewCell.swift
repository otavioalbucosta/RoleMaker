//
//  CardTableViewCell.swift
//  RoleMaker
//
//  Created by Cicero Nascimento on 09/06/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        card.clipsToBounds = false
        card.layer.cornerRadius = 15
        card.backgroundColor = UIColor.white
//        NSLayoutConstraint.activate([
//
//        ])
        card.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
//        self.backgroundColor = UIColor(red: 247.0/255, green: 247.0/255, blue: 247.0/255, alpha: 1.0)
    }
    @IBOutlet weak var nomeLocal: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var nomeEndereco: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var nomeImagem: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        
        
    }
    
}
