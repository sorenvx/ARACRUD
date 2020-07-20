//
//  MainVC.swift
//  ARACRUD
//
//  Created by Toni De Gea on 19/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import UIKit


class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTxt: UITextField!
    
    var isSorted: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        searchTxt.delegate = self
        tableView.rowHeight = 50.0
        ApiManager.instance.getAllCharacters { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        navigationController?.presentTransparentNavigationBar()
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: TO_NEW, sender: nil)
    }
    
    @IBAction func optionsPressed(_ sender: UIBarButtonItem) {
        if isSorted {
            ApiManager.instance.sortAllCharactersDescByName { (success) in
                if success {
                    self.tableView.reloadData()
                }
            }
            isSorted = false
        } else {
            
            ApiManager.instance.sortAllCharactersAscByName { (success) in
                if success {
                    self.tableView.reloadData()
                }
            }
        // Aunque también se puede hacer de esta forma y no hay que llamar a la API pero como es una prueba de CRUD lo he dejado de la otra forma.
            // ApiManager.instance.characters.sort {
            //    $0.name < $1.name
            // }
            isSorted = true
        }
        self.tableView.reloadData()
    }
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTxt.endEditing(true)
        self.tableView.reloadData()
    }
}

extension MainVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTxt.endEditing(true)
        return true
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTxt.text != "" {
            return true
        } else {
            searchTxt.placeholder = NSLocalizedString("SEARCH", comment: "")
            ApiManager.instance.getAllCharacters { (success) in
                if success {
                    self.tableView.reloadData()
                }
            }
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let name = searchTxt.text!
        
        ApiManager.instance.getCharacterByName(name: name) { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        searchTxt.text = ""
        

    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func configure() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ApiManager.instance.characters.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: TO_DETAIL, sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: mainCell, for: indexPath) as? MainCell {
            
            let character = ApiManager.instance.characters[indexPath.row]
            cell.configureCell(name: character.name)
            
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}


extension MainVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailVC,
            let indexPath = sender as? IndexPath else {
                return
        }
        
        destination.characterDetail = ApiManager.instance.characters[indexPath.row]
    }
    
}
