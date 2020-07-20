//
//  UpdateData.swift
//  ARACRUD
//
//  Created by Toni De Gea on 20/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import UIKit

class UpdateDataVC: UIViewController {
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    
    var birthdateString = ""
    var id: String?
    
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
        
        if let idCharacter = id {
            if let name = nameTxt.text  {
                ApiManager.instance.updateCharacter(name: name, birthdate: birthdateString, id: idCharacter) { (success) in
                    if success {
                        let alert =  UIAlertController(
                            title: NSLocalizedString("SAVED", comment: ""),
                            message: NSLocalizedString("", comment: ""),
                            preferredStyle: .alert) // tipo de view controller especial
                        
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            NotificationCenter.default.post(name: NOTIF_USER_DETAIL_DID_CHANGE, object: nil)
                            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true)
                    } else {
                        print("fallo")
                    }
                }
            }
        }
    }
    
}
