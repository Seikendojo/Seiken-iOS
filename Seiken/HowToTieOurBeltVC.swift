//
//  HowToTieOurBeltVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-27.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit


class HowToTieOurBeltVC: UIViewController
{
    // MARK: - Properties
    @IBOutlet weak var tieBeltLabel: UILabel!
    @IBOutlet weak var tieBeltWebView: UIWebView!
    
    // MArK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tieBeltWebView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AUoSApwcWOw\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    }
}
   


