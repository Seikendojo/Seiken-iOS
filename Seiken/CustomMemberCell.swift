//
//  CustomMemberCell.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-10.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class CustomMemberCell: UITableViewCell
{
    // MARK: - Outlets
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var subtitleLable: UILabel!
    
    // MARK: - Helpers
    func configure(with title: String, andSubtitle subtitle: String)
    {
        titleLabel.text = title
        subtitleLable.text = subtitle
    }
}
