//
//  BeltTableViewCell.swift
//  Seiken
//
//  Created by Shahin on 2017-10-20.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class BeltTableViewCell: UITableViewCell {

    @IBOutlet weak var beltTitleLabel: UILabel!
    
    func configure(with belt: String)
    {
        beltTitleLabel.text = belt
    }
}
