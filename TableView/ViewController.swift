//
//  ViewController.swift
//  TableView
//
//  Created by Ogulcan Kara on 15.08.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var ulkeler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye","Almanya","Japonya","Güney Kore","Fransa","Mısır"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //Kac bölüm olacak
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
        //Toplam kaç veri olacak
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreadi", for: indexPath)
        
        cell.textLabel?.text = ulkeler[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seçilen ülke : \(ulkeler[indexPath.row])")
    }
    //Eski kod
   /* func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let silAction = UITableViewRowAction(style: .default, title: "Sil", handler: {
            (action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            
            print("\(self.ulkeler[indexPath.row]) yi sil")
        })
        
        let duzenleAction = UITableViewRowAction(style: .normal, title: "Düzenle", handler: {
            (action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            
            print("\(self.ulkeler[indexPath.row]) yi düzenle")
        })
        
        return [silAction,duzenleAction]
        
    } */
    
    //Yeni kod
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            (contextualAction, view, boolValue) in
            
            print("\(self.ulkeler[indexPath.row]) yi sil")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            (contextualAction, view, boolValue) in
            
            print("\(self.ulkeler[indexPath.row]) yi düzenle")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
        
    }
}

