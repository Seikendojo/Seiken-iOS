//
//  SignInTableViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import Firebase

class SignInTableViewController: BaseTableViewController
{
    fileprivate typealias singinTextField = Constants.SKTextField
    fileprivate typealias segues = Constants.SegueIdentifiers
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: SKTextField!
    @IBOutlet weak var passwordTextField: SKTextField!
    @IBOutlet weak var forgotButton: UIButton!
    
    // MARK: - Properties
    let currentUser = User.current
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        fillInTextFields()
    }
    
    // MARK: - Helpers
    fileprivate func setupUI()
    {
        tableView.allowsSelection = false
        
        emailTextField.iconText = singinTextField.emailIcon
        passwordTextField.iconText = singinTextField.passwordIcon
        passwordTextField.iconFont = UIFont(name: singinTextField.iconFont, size: 17)
        passwordTextField.iconMarginBottom = 0.0
    }
    
    fileprivate func presentSignupSuccessHUD()
    {
        execute(after: 2.0) {
            self.presentHUDSuccess()
            execute(after: 1.0) {
                self.hud?.dismiss(true)
            }
        }
    }
    
    fileprivate func fillInTextFields()
    {
        if let count = currentUser.password?.count, count >= 1
        {
            present(AlertService.signupSubmittionAlert(), animated: true)
        }
        emailTextField.text = currentUser.email
        passwordTextField.text = currentUser.password
    }
    
    fileprivate func saveToken()
    {
        SessionService.storeUserToken(currentUser.userID ?? "not found")
    }

    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    func isPasswordFieldValid() -> Bool
    {
        return passwordTextField.text?.count ?? 0 >= kMinimumPasswordLength-1
    }
    
    fileprivate func presentFailedSigninAlert(with error: Error)
    {
        execute(after: 1.0, closure: {
            let alert = AlertService.prepareFailureAlert(with: error, for: .signup)
            alert.addAction(withTitle: "Okay", style: .cancel, handler: nil)
            self.present(alert, animated: true, completion: {
                self.hud?.dismiss(true)
            })
        })
    }
    
    
    fileprivate func handleSignin()
    {
        if let email = emailTextField.text, let password = passwordTextField.text, isEmailFieldValid() && isPasswordFieldValid()
        {
            currentUser.email = email
            currentUser.password = password
            hud?.show(true)
            signinUser(with: email, andPassword: password)
        }
        else
        {
            shakeTextFields()
        }
    }
    
    fileprivate func shakeTextFields()
    {
        if !isEmailFieldValid()
        {
            emailTextField.shake()
        }
        
        if !isPasswordFieldValid()
        {
            passwordTextField.shake()
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
        
        if textField === emailTextField
        {
            _ = passwordTextField.becomeFirstResponder()
        }
        else if textField === passwordTextField
        {
            textField.resignFirstResponder()
            handleSignin()
        }
        
        return true
    }
    
    @IBAction func textFieldEditingDidChange(_ textField: SKTextField)
    {
        switch textField {
        case emailTextField:
            textField.errorMessage = isEmailFieldValid() ? "" : "invalid email"
            break
        default:
            textField.errorMessage = isPasswordFieldValid() ? "" : "invalid password"
            break
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        forgotButton.isHidden = textField === passwordTextField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        forgotButton.isHidden = false
    }
    
    // MARK: - Firebase
    fileprivate func signinUser(with email: String, andPassword password: String)
    {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error
            {
                self.presentFailedSigninAlert(with: error)
            }
            else
            {
                if let isEmailVerified = Auth.auth().currentUser?.isEmailVerified, isEmailVerified == true, let userID = self.currentUser.userID
                {
                    self.saveToken()
                    let userReference = self.usersReference.child(userID)
                    userReference.observe(.value, with: { snapshot in
                        self.currentUser.parse(snapshot)
                        self.presentHUDSuccess()
                        execute(after: 1.0, closure: {
                            self.hud?.dismiss(true)
                            self.dismiss(animated: true, completion: nil)
                        })
                    })
                }
                else
                {
                    let alert = AlertService.prepareResendEmailVerificiationAlert()
                    let resendAction = UIAlertAction(title: "Resend Verification", style: .default, handler: { (action) in
                        self.resendEmailVerification()
                    })
                    alert.addAction(resendAction)
                    self.present(alert, animated: true, completion: {
                        self.hud?.dismiss(true)
                    })
                }
            }
        })
    }
    
    fileprivate func resendEmailVerification()
    {
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            if let error = error
            {
                self.presentFailedSigninAlert(with: error)
            }
            else
            {
                self.presentHUDSuccess()
                execute(after: 1.0, closure: {
                    self.hud?.dismiss(true)
                    self.dismiss(animated: true, completion: nil)
                })
            }
        })
    }
    
    // MARK: - Actions
    @IBAction func signinButtonTapped(_ sender: UIButton)
    {
        handleSignin()
    }
    
    @IBAction func learnButtonTapped(_ sender: UIButton)
    {
        present(AlertService.presentDisabledFeatureAlert(), animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Protocols
    func handleSignupSuccess()
    {
        present(AlertService.prepareSuccessfulSignupAlert(), animated: true) {
            self.emailTextField.text = self.currentUser.email
            self.passwordTextField.text = self.currentUser.password
        }
    }
}
