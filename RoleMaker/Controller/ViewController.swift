//
//  ViewController.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 06/06/22.
//

import UIKit

class ViewController: UIViewController {
    let localizacoes = ["Localizaçao 1", "Localização principal", "Localizaçao 3"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 110
        
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
//        tableView.selectionStyle = .none
    
        

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localizacoes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
//        let localizacao = localizacoes[indexPath.row]
//        celula.textLabel?.text = localizacao
        let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
            CardTableViewCell
        
        celula.nomeLocal.text=localizacoes[indexPath.row]
        celula.horario.text=localizacoes[indexPath.row]
        celula.nomeEndereco.text=localizacoes[indexPath.row]
        celula.nomeImagem.image = UIImage(named: "Rectangle-1")
        celula.selectionStyle = .none
//        celula.nomeImagem.image=localizacoes[indexPath.row]
        return celula
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 110.0
//    }
}
