//
//  MainCell.swift
//  ARACRUD
//
//  Created by Toni De Gea on 19/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = nil
    }

    
    func configureCell(name: String) {
        nameLabel.text = name
    }

}
