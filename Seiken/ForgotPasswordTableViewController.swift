//
//  ForgotPasswordTableViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordTableViewController: BaseTableViewController
{
    fileprivate typealias singinTextField = Constants.SKTextField
    
    // MARK: - Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: SKTextField!
    
    // MARK: - Properties
    let currentUser = User.current
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
 
    
    
    // MARK: - Helpers
    fileprivate func setupUI()
    {
        tableView.allowsSelection = false
        emailTextField.iconText = singinTextField.emailIcon
    }
    
    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    fileprivate func handleSubmit()
    {
        if isEmailFieldValid(), let _ = emailTextField.text
        {
            hud?.show(true)
            
            Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
                
                if error != nil
                {
                    // Error - Unidentified Email
                    self.presentFailureAlert(with: error!)
                }
                else
                {
                    // Success - Sent recovery email
                    self.presentSuccessAlert()
                }
            }
        }
    }
    
    fileprivate func handleOkayAction()
    {
        hud?.dismiss(true)
        currentUser.password = ""
        execute(after: 1.0, closure: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    fileprivate func presentFailureAlert(with error: Error)
    {
        let alert = AlertService.prepareFailureAlert(with: error, for: .passwordReset)
        alert.addAction(withTitle: "Okay", style: .cancel, handler: {
            self.handleOkayAction()
        })
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func presentSuccessAlert()
    {
        execute(after: 1.0) {
            let alert = AlertService.prepareForgotPasswordAlert()
            alert.addAction(withTitle: "Okay", style: .cancel, handler: {
                self.handleOkayAction()
            })

            self.present(alert, animated: true, completion: nil)
            User.current.password = ""
        }
    }
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
        case 0:
            return view.bounds.height * 0.40
        case 3:
            return 90.0
        default :
            return 50.0
        }
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        handleSubmit()
        return true
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonWasTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButtonWasTapped(_ sender: UIButton)
    {
        handleSubmit()
    }
    
    @IBAction func textFieldEditingDidChange(_ textfield: SKTextField)
    {
        textfield.errorMessage = isEmailFieldValid() ? "" : "invalid email"
    }
    
}
