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
        birthdateTxt.text = characterDetail?.birthdate
    }
    
    @IBAction func changeDataPressed(_ sender: UIButton) {
        
    }
    
}
