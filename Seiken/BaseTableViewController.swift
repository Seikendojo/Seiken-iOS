//
//  BaseTableViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import ThunderCats
import M13ProgressSuite
import FirebaseDatabase

class BaseTableViewController: UITableViewController, UITextFieldDelegate
{
    typealias refs = Constants.Firebase.References
    typealias status = Constants.HUD.Status
    
    // MARK: - Properties
    let usersReference = Database.database().reference(withPath: refs.users)
    var hud: M13ProgressHUD?
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        addNotifications()
        configureHUD()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        removeNotifications()
    }
    
    // MARK: - Notifications
    fileprivate func addNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Handling Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {    }
    
    @objc func keyboardWillHide(_ notification: Notification) {    }
    
    // MARK: - Progress HUD
    func configureHUD()
    {
        hud = M13ProgressHUD(progressView: M13ProgressViewRing())
        hud?.configure()
        view.addSubview(hud!)
    }
    
    func presentHUDSuccess(with status: String = "Success!")
    {
        hud?.presentSuccess(with: status)
    }
}
