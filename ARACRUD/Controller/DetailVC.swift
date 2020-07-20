//
//  DetailVC.swift
//  ARACRUD
//
//  Created by Toni De Gea on 20/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import UIKit


class DetailVC: UIViewController {
    
    var characterDetail: User?
    var id: String?
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var birthdateTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.presentTransparentNavigationBar()
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        navigationController?.navigationItem.backBarButtonItem?.title = characterDetail?.name
        nameTxt.text = characterDetail?.name
        showDateProperly()
    }
    
    @IBAction func changeDataPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_UPDATE, sender: nil)
    }
    
    func showDateProperly() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: characterDetail?.birthdate ?? "")
        
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let finalStringBirthdate = dateFormatter.string(from: date ?? Date())
        birthdateTxt.text = finalStringBirthdate
    }
    
}

extension DetailVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UpdateDataVC else { return }
        
        destination.id = characterDetail?.id
    }
    
}
