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

        celula.nomeLocal.text=localizacoes[indexPath.row].name
        celula.horario.text=String(localizacoes[indexPath.row].rating)
        celula.nomeEndereco.text=localizacoes[indexPath.row].vicinity
        celula.nomeImagem.image = UIImage(named: "Rectangle-1")
        celula.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)
        celula.selectionStyle = .none
        
//        NSLayoutConstraint.activate([
//            celula.botto
//        ])
        
       // class ViewController: UIViewController {


        //}
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
//        show(mapKitController,sender: self)
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    let localizacoes = Place.mock()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleNavigation: UINavigationItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var labelHome1: UILabel!
    @IBOutlet weak var cardHome: UIView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       

        
        
        let standard = UINavigationBarAppearance()
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        standard.configureWithOpaqueBackground()
        standard.titleTextAttributes = [.foregroundColor: UIColor.white]
        standard.largeTitleTextAttributes = [.foregroundColor: UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)]
        standard.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)

        navigationItem.standardAppearance = standard
        navigationItem.scrollEdgeAppearance = standard
        navigationItem.compactAppearance = standard
        
        tableView.dataSource = self
        tableView.rowHeight = 130
        tableView.fillerRowHeight = 5

        tableView.delegate = self
        tableView.dataSource = self

        labelHome1.textColor = UIColor.init(red: 255 / 255, green: 180 / 255, blue: 91 / 255, alpha: 1)
        cardHome.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)
        view.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)
        tableView.backgroundColor = UIColor.init(red: 21 / 255, green: 28 / 255, blue: 58 / 255, alpha: 1)
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
