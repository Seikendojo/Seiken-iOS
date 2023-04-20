//
//  M13ProgressSuiteExtensions.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation
import M13ProgressSuite

extension M13ProgressHUD
{
    func configure()
    {
        self.progressViewSize = CGSize(width: 60, height: 60)
        self.animationPoint = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        self.primaryColor = .green
        self.secondaryColor = .skRed
        self.status = "Processing"
        self.indeterminate = true
        self.setProgress(0.1, animated: true)
    }
    
    func presentSuccess(with status: String = "Success!")
    {
        self.status = status
        self.setProgress(1.0, animated: true)
        self.indeterminate = false
        self.perform(M13ProgressViewActionSuccess, animated: true)
    }
}
