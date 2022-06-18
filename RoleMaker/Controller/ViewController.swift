//
//  ViewController.swift
//  RoleMaker
//
//  Created by Otávio Albuquerque on 06/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localizacoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
            CardTableViewCell

        celula.nomeLocal.text=localizacoes[indexPath.row]
        celula.horario.text=localizacoes[indexPath.row]
        celula.nomeEndereco.text=localizacoes[indexPath.row]
        celula.nomeImagem.image = UIImage(named: "Rectangle-1")
        
//        NSLayoutConstraint.activate([
//            celula.botto
//        ])
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerToPresent = SheetViewController()
            if let sheet = viewControllerToPresent.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersEdgeAttachedInCompactHeight = true
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            }
        var mapKitController = MapKitViewController()
        show(mapKitController,sender: self)
//        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    let localizacoes = ["Localizaçao primeira", "Localização principal", "Localizaçao 3"]
    @IBOutlet weak var tableView: UITableView!
//    let button = UIButton(type: .system)
//    // MARK: Criando a funcao que vai ser chamada no #selector
//    @objc func buttonAction(){
////        let sheetViewController = SheetViewController(nibName: "SheetViewController", bundle: nil)
////        present(sheetViewController, animated: true)
//        // MARK: instanciando a middleSheet para ser chamado no preset() no final da func
//        let viewControllerToPresent = SheetViewController()
//            if let sheet = viewControllerToPresent.sheetPresentationController {
//                sheet.detents = [.medium(), .large()]
//                sheet.largestUndimmedDetentIdentifier = .medium
//                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//                sheet.prefersEdgeAttachedInCompactHeight = true
//                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
//            }
//            present(viewControllerToPresent, animated: true, completion: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        view.addSubview(button)
        tableView.dataSource = self
        tableView.rowHeight = 110

        tableView.delegate = self
        tableView.dataSource = self

        view.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)
        tableView.separatorStyle = .none
//        tableView.selectionStyle = .none
     // MARK: Contraints e configuracoes do buttao
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.configuration = .borderedTinted()
//        button.configuration?.title = "Hello World!"
//        button.addTarget(self, action: #selector(buttonAction), for: .primaryActionTriggered)
//        
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }
}


//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return localizacoes.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
//            CardTableViewCell
//
//        celula.nomeLocal.text=localizacoes[indexPath.row]
//        celula.horario.text=localizacoes[indexPath.row]
//        celula.nomeEndereco.text=localizacoes[indexPath.row]
//        celula.nomeImagem.image = UIImage(named: "Rectangle-1")
//        return celula
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("aaaa")
//    }
//}



//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return localizacoes.count
//}
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let celula = Bundle(for: CardTableViewCell.self).loadNibNamed("CardTableViewCell", owner: self, options: nil)?.first as!
//        CardTableViewCell
//
//    celula.nomeLocal.text=localizacoes[indexPath.row]
//    celula.horario.text=localizacoes[indexPath.row]
//    celula.nomeEndereco.text=localizacoes[indexPath.row]
//    celula.nomeImagem.image = UIImage(named: "Rectangle-1")
////        celula.selectionStyle = .none
////        celula.nomeImagem.image=localizacoes[indexPath.row]
//    return celula
//}
//
//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//    tableView.deselectRow(at: indexPath, animated: true)
//
//    let viewControllerToPresent = SheetViewController()
//        if let sheet = viewControllerToPresent.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.largestUndimmedDetentIdentifier = .medium
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//            sheet.prefersEdgeAttachedInCompactHeight = true
//            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
//        }
//    self.present(viewControllerToPresent, animated: true, completion: nil)
////        print("oioioi")
//}
