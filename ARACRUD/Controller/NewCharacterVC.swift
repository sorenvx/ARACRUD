//
//  NewCharacterVC.swift
//  ARACRUD
//
//  Created by Toni De Gea on 20/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import UIKit

class NewCharacterVC: UIViewController {
    
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    
    var birthdateString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dataPickerChanged(_ sender: UIDatePicker) {
        let horaSeleccionada = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        birthdateString = dateFormatter.string(from: horaSeleccionada)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        if let name = nameTxt.text  {
            ApiManager.instance.registerCharacter(name: name, birthdate: birthdateString) { (success) in
                if success {
                    let alert =  UIAlertController(
                    title: NSLocalizedString("DELETEFAV", comment: ""),
                    message: NSLocalizedString("SURE", comment: ""),
                    preferredStyle: .alert) // tipo de view controller especial
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true)
                } else {
                    print("fallo")
                }
            }
        }
        
    }
}

