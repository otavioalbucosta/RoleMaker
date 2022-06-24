//
//  TableViewController.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 23/06/22.
//

import UIKit

class FinalTableViewController: UITableViewController {
    
    var startPlace: Place? = nil
    var midPlace: Place? = nil
    var endPlace: Place? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 130
        
        tableView.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        
        tableView.separatorStyle = .none
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let startPlace = startPlace {
                let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
                CardTableViewCell
                celula.nomeLocal.text = startPlace.name
                celula.nomeEndereco.text = startPlace.vicinity
                celula.nomeImagem.image = UIImage(named: "bar2")
                if let rating = startPlace.rating {
                    celula.horario.text = String(rating)
                }

                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            }
        }else if indexPath.row == 1 {
            if let midPlace = midPlace {
                let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
                CardTableViewCell
                celula.nomeLocal.text = midPlace.name
                celula.nomeEndereco.text = midPlace.vicinity
                celula.nomeImagem.image = UIImage(named: "bar2")
                if let rating = midPlace.rating {
                    celula.horario.text = String(rating)
                }
                celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
                celula.selectionStyle = .none
                return celula
            }
        }else if indexPath.row == 2 {
            if let endPlace = endPlace {
                let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
                CardTableViewCell
                celula.nomeLocal.text = endPlace.name
                celula.nomeEndereco.text = endPlace.vicinity
                celula.nomeImagem.image = UIImage(named: "bar1")
                if let rating = endPlace.rating {
                    celula.horario.text = String(rating)
                }
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
        celula.nomeImagem.image = UIImage(named: "lanchonete")
        celula.backgroundColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        celula.selectionStyle = .none

       return celula
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
