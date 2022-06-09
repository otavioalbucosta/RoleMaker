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
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localizacoes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let localizacao = localizacoes[indexPath.row]
        celula.textLabel?.text = localizacao
        return celula
    }
}
