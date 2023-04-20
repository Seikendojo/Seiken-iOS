//
//  SignUpTableViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import RMDateSelectionViewController
import Firebase
import MessageUI

class SignUpTableViewController: BaseTableViewController, MFMailComposeViewControllerDelegate
{
    fileprivate typealias signupTextField = Constants.SKTextField
    
    // MARK: - Properties
    let currentUser = User.current
    var selectedDate = Date()
    
    // MARK: - Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var firstnameTextField: SKTextField!
    @IBOutlet weak var lastnameTextField: SKTextField!
    @IBOutlet weak var emailTextField: SKTextField!
    @IBOutlet weak var passwordTextField: SKTextField!
    @IBOutlet weak var passwordConfirmTextField: SKTextField!
    @IBOutlet weak var birthDateTextField: SKTextField!
    
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
        
        firstnameTextField.iconText = signupTextField.personIcon
        lastnameTextField.iconText = signupTextField.personIcon
        emailTextField.iconText = signupTextField.emailIcon
        passwordTextField.iconText = signupTextField.passwordIcon
        passwordTextField.iconFont = UIFont(name: signupTextField.iconFont, size: 17)
        passwordTextField.iconMarginBottom = 0.0
        passwordConfirmTextField.iconText = signupTextField.passwordIcon
        passwordConfirmTextField.iconFont = UIFont(name: signupTextField.iconFont, size: 17)
        passwordConfirmTextField.iconMarginBottom = 0.0
        birthDateTextField.iconText = signupTextField.calendarIcon
    }
    
    func handleBirthDateTap()
    {
        view.endEditing(true)
        
        let selectAction = RMAction<UIDatePicker>(title: "Select", style: RMActionStyle.done) { controller in
            print("Successfully selected date: ", controller.contentView.date);
            self.datePickerPickedDate(controller.contentView.date)
        }
        
        let cancelAction = RMAction<UIDatePicker>(title: "Cancel", style: RMActionStyle.cancel) { _ in
            print("Date selection was canceled")
        }
        
        let birthDatePickerController = RMDateSelectionViewController(style: .black, title: "Pick Your Birth Date", message: "", select: selectAction, andCancel: cancelAction)!;
        birthDatePickerController.datePicker.datePickerMode = .date
        birthDatePickerController.datePicker.date = selectedDate
        
        present(birthDatePickerController, animated: true, completion: nil)
    }
    
    func datePickerPickedDate(_ date: Date!)
    {
        selectedDate = date
        
        determineUserRoleBasedOn(date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        birthDateTextField.text = dateFormatter.string(from: date)
        currentUser.birthDate = dateFormatter.string(from: date)
        
        view.endEditing(true)
    }
    
    func determineUserRoleBasedOn(_ birthdate: Date)
    {
        let calendar = Calendar.current
        _ = calendar.dateComponents([.year], from: birthdate)
    }
    
    func isFirstNameValid() -> Bool
    {
        return firstnameTextField.text?.count ?? 0 >= 1
    }
    
    func isLastNameValid() -> Bool
    {
        return lastnameTextField.text?.count ?? 0 >= 1
    }
    
    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    func isPasswordFieldValid() -> Bool
    {
        return passwordTextField.text?.count ?? 0 >= kMinimumPasswordLength
    }
    
    func isPasswordConfirmFieldValid() -> Bool
    {
        return passwordConfirmTextField.text == passwordTextField.text
    }
    
    func isBirthdateValid() -> Bool
    {
        return birthDateTextField.text?.count ?? 0 >= 1
    }
    
    func shakeTextFields()
    {
        if !isFirstNameValid()
        {
            firstnameTextField.shake()
        }
        
        if !isLastNameValid()
        {
            lastnameTextField.shake()
        }
        
        if !isEmailFieldValid()
        {
            emailTextField.shake()
        }
        
        if !isPasswordFieldValid()
        {
            passwordTextField.shake()
        }
        
        if !isPasswordConfirmFieldValid()
        {
            passwordConfirmTextField.shake()
        }
        
        if !isBirthdateValid()
        {
            birthDateTextField.shake()
        }
    }
    
    fileprivate func presentFailedSignupAlert(with error: Error)
    {
        execute(after: 1.0, closure: {
            let alert = AlertService.prepareFailureAlert(with: error, for: .signup)
            alert.addAction(withTitle: "Okay", style: .cancel, handler: nil)
            self.present(alert, animated: true, completion: {
                self.hud?.dismiss(true)
            })
        })
    }
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
        case 0:
            return view.bounds.height * 0.40
        case 7:
            return 90.0
        default :
            return 50.0
        }
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField {
        case firstnameTextField:
            _ = lastnameTextField.becomeFirstResponder()
            break
        case lastnameTextField:
            _ = emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            _ = passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            _ = passwordConfirmTextField.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
            handleBirthDateTap()
            return false
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == birthDateTextField
        {
            handleBirthDateTap()
        }
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton)
    {
        if isFirstNameValid() && isLastNameValid() && isEmailFieldValid() && isPasswordFieldValid() && isPasswordConfirmFieldValid()
        {
            currentUser.firstName = firstnameTextField.text!
            currentUser.lastName = lastnameTextField.text!
            currentUser.email = emailTextField.text!
            currentUser.password = passwordTextField.text!
            currentUser.seikenUserRole = .member
            
            createUser(with: currentUser.email, andPassword: currentUser.password)
            
        }
        else
        {
            shakeTextFields()
        }
        
    }
    
    @IBAction func textFieldEditingDidChange(_ textField: SKTextField)
    {
        switch textField {
        case firstnameTextField:
            firstnameTextField.errorMessage = isFirstNameValid() ? "" : "invalid first name"
            break
        case lastnameTextField:
            lastnameTextField.errorMessage = isLastNameValid() ? "" : "invalid last name"
            break
        case emailTextField:
            emailTextField.errorMessage = isEmailFieldValid() ? "" : "invalid email"
            break
        case passwordTextField:
            passwordTextField.errorMessage = isPasswordFieldValid() ? "" : "invalid password"
            break
        case passwordConfirmTextField:
            passwordConfirmTextField.errorMessage = isPasswordConfirmFieldValid() ? "" : "invalid password"
            break
        default:
            _ = textField.resignFirstResponder()
            handleBirthDateTap()
            break
        }
    }
    
    // MARK: - Firebase
    fileprivate func createUser(with email: String?, andPassword password: String?)
    {
        guard let email = email, let password = password else { return }
        hud?.show(true)
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let err = error
            {
                self.presentFailedSignupAlert(with: err)
            }
            else
            {
                self.setDisplayName(for: self.currentUser)
            }
        }
    }
    
    fileprivate func setDisplayName(for user: User)
    {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = user.firstName
        changeRequest?.commitChanges(completion: { error in
            if let error = error
            {
                self.presentFailedSignupAlert(with: error)
            }
            else
            {
                self.sendEmailVerification()
            }
        })
    }
    
    fileprivate func sendEmailVerification()
    {
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            if let error = error
            {
                self.presentFailedSignupAlert(with: error)
            }
            else
            {
                guard let userID = self.currentUser.userID else { return }
                let userReference = self.usersReference.child(userID)
                userReference.setValue(self.currentUser.zip())
                self.presentHUDSuccess(with: "Signed up\n successfully!")
                execute(after: 1.0, closure: {
                    self.hud?.dismiss(true)
                    self.dismiss(animated: true, completion: nil)
                })
            }
        })
    }
}
