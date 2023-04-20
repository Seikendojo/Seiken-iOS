//
//  SKTextField.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SKTextField: SkyFloatingLabelTextFieldWithIcon
{
    fileprivate typealias textField = Constants.SKTextField
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        iconFont = UIFont(name: textField.iconFont, size: 15)
        iconMarginBottom = 2.0
        iconColor = .skLightGrey
        selectedIconColor = .black
        placeholderColor = .skLightGrey
//        lineColor = .lightGray
        selectedLineColor = .black
        errorColor = .skRed
        textColor = .black
        selectedTitleColor = .darkGray
        titleColor = .skLightGrey
    }
}
