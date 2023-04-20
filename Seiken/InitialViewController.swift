//
//  InitialViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import M13ProgressSuite

class InitialViewController: UIViewController
{
    typealias refs = Constants.Firebase.References
    typealias keys = Constants.Keys.SessionService
    typealias segues = Constants.SegueIdentifiers
    
    // MARK: - Properties
    fileprivate var hud: M13ProgressHUD?
    
    // MARK: - Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoVerticalConstraint: NSLayoutConstraint!
    
    // MARK: - View Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        execute(after: 1) {
            UIView.animate(withDuration: 0.3, animations: {
                self.logoImageView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
                self.logoImageView.alpha = 0.0
            }) { (completed) in
                self.goToMainScreen()
            }
        }
    }
    
    // MARK: - Helpers
    fileprivate func goToMainScreen()
    {
        execute(after: 1.0) {
            self.performSegue(withIdentifier: segues.toMain, sender: self)
        }
    }
}
