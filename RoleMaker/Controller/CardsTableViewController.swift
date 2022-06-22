//
//  CardsTableViewController.swift
//  RoleMaker
//
//  Created by thays lunes on 15/06/22.
//

import UIKit

class CardsTableViewController: UITableViewController {
    var mainPlace: Place? = nil
    var preParty: Place? = nil
    var afterParty: Place? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.rowHeight = 130
        
        tableView.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        
        tableView.separatorStyle = .none
        
//        self.view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//        ])

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let preParty = preParty {
                let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
                CardTableViewCell
                celula.nomeLocal.text = preParty.name
                celula.nomeEndereco.text = preParty.vicinity
                celula.horario.text = String(preParty.rating)
                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            } else {
                let celula = Bundle(for: ChoosePlaceCardTableViewCell.self).loadNibNamed("ChoosePlaceCardTableViewCell", owner: self, options: nil)?.first as!
                    ChoosePlaceCardTableViewCell
                celula.chooseLabel.text = "O que você quer fazer\n antes do evento"
                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            }
        }else if indexPath.row == 1 {
            if let mainPlace = mainPlace {
                let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
                CardTableViewCell
                celula.nomeLocal.text = mainPlace.name
                celula.nomeEndereco.text = mainPlace.vicinity
                celula.horario.text = String(mainPlace.rating)
                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            }
        }else if indexPath.row == 2 {
            if let afterPaty = afterParty {
                let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
                CardTableViewCell
                celula.nomeLocal.text = afterPaty.name
                celula.nomeEndereco.text = afterPaty.vicinity
                celula.horario.text = String(afterPaty.rating)
                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            } else {
                let celula = Bundle(for: ChoosePlaceCardTableViewCell.self).loadNibNamed("ChoosePlaceCardTableViewCell", owner: self, options: nil)?.first as!
                    ChoosePlaceCardTableViewCell
                celula.chooseLabel.text = "O que você quer fazer\n depois do evento"
                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            }
        }
        
        let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
        CardTableViewCell
        celula.nomeLocal.text = "Erro"
        celula.nomeEndereco.text = "Erro"
    celula.horario.text = "Erro"
        celula.nomeImagem.image = UIImage(named: "Rectangle-1")
        celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        celula.selectionStyle = .none

       return celula
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        let mapKitController = MapKitViewController()
        mapKitController.delegate = self
        mapKitController.cellnum = didSelectRowAt.row
        show(mapKitController,sender: self)
        
    }

    
}

extension CardsTableViewController: MapKitViewControllerDelegate {
    func addPlace(place: Place, cellNumber: Int) {
        if cellNumber == 0 {
            self.preParty = place
        }else if cellNumber == 2{
            self.afterParty = place
        }
        self.tableView.reloadData()
    }
}

