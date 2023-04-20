//
//  ReferralViewController.swift
//  Seiken
//
//  Created by Elham on 10/31/17.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import RMDateSelectionViewController
import MessageUI

class ReferralViewController: BaseTableViewController, MFMailComposeViewControllerDelegate
{
    
    fileprivate typealias referralTextField = Constants.SKTextField
    
    // MARK: - Properties
    let currentUser = User.current
    
    // Mark: - Outlets
    @IBOutlet weak var friendsFullNameTextField: SKTextField!
    @IBOutlet weak var friendsEmailTextField: SKTextField!
    @IBOutlet weak var friendsAgeTextField: SKTextField!
    @IBOutlet weak var friendsPhoneNumberTextField: SKTextField!
    @IBOutlet weak var referrersFullNameTextField: SKTextField!
    @IBOutlet weak var referrersEmailTextField: SKTextField!
    @IBOutlet weak var referrersAgeTextField: SKTextField!
    @IBOutlet weak var referrersPhoneNumberTextField: SKTextField!
    @IBOutlet weak var referralSubmitButton: UIButton!
    
    // Mark: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Mark: - Helpers
    fileprivate func setupUI()
    {
        tableView.allowsSelection = false
        
        friendsFullNameTextField.iconText = referralTextField.personIcon
        friendsEmailTextField.iconText = referralTextField.emailIcon
        friendsAgeTextField.iconText = referralTextField.ageIcon
        friendsPhoneNumberTextField.iconText = referralTextField.phoneIcon
        referrersFullNameTextField.iconText = referralTextField.personIcon
        referrersEmailTextField.iconText = referralTextField.emailIcon
        referrersAgeTextField.iconText = referralTextField.ageIcon
        referrersPhoneNumberTextField.iconText = referralTextField.phoneIcon
    }
    
    // Mark: _ Entry Validation
    func isFriendsFullNameValid() -> Bool
    {
        return friendsFullNameTextField.text?.count ?? 0 >= 1
    }
    
    func isFriendsEmailFieldValid() -> Bool
    {
        return friendsEmailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    func isFriendsAgeValid() -> Bool
    {
        return friendsAgeTextField.text?.count ?? 0 >= 1
    }
    
    func isFriendsPhoneNumberValid() -> Bool
    {
        return friendsPhoneNumberTextField.text?.count ?? 0 >= 10
    }
    
    func isReferresFullNameValid() -> Bool
    {
        return referrersFullNameTextField.text?.count ?? 0 >= 1
    }
    
    func isReferresEmailFieldValid() -> Bool
    {
        return referrersEmailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    func isReferresAgeValid() -> Bool
    {
        return referrersAgeTextField.text?.count ?? 0 >= 1
    }
    
    func isReferresPhoneNumberValid() -> Bool
    {
        return referrersPhoneNumberTextField.text?.count ?? 0 >= 10
    }
    
    func shakeTextFields()
    {
        if !isFriendsFullNameValid()
        {
            friendsFullNameTextField.shake()
        }
        
        if !isFriendsEmailFieldValid()
        {
            friendsEmailTextField.shake()
        }
        
        if !isFriendsAgeValid()
        {
            friendsAgeTextField.shake()
        }
        
        if !isFriendsPhoneNumberValid()
        {
            friendsPhoneNumberTextField.shake()
        }
        
        if !isReferresFullNameValid()
        {
            referrersFullNameTextField.shake()
        }
        
        if !isReferresEmailFieldValid()
        {
            referrersEmailTextField.shake()
        }
        
        if !isReferresAgeValid()
        {
            referrersAgeTextField.shake()
        }
        
        if !isReferresPhoneNumberValid()
        {
            referrersPhoneNumberTextField.shake()
        }
    }
    
    // Mark: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField {
        case friendsFullNameTextField:
            _ = friendsEmailTextField.becomeFirstResponder()
            break
        case friendsEmailTextField:
            _ = friendsAgeTextField.becomeFirstResponder()
            break
        case friendsAgeTextField:
            _ = friendsPhoneNumberTextField.becomeFirstResponder()
            break
        case friendsPhoneNumberTextField:
            _ = referrersFullNameTextField.becomeFirstResponder()
            break
        case referrersFullNameTextField:
            _ = referrersEmailTextField.becomeFirstResponder()
            break
        case referrersEmailTextField:
            _ = referrersAgeTextField.becomeFirstResponder()
            break
        case referrersAgeTextField:
            _ = referrersPhoneNumberTextField.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
    // Mark: - Actions
    @IBAction func submitButtonTapped(_ sender: UIButton)
    {
        if isFriendsFullNameValid() && isFriendsEmailFieldValid() && isFriendsAgeValid() && isFriendsPhoneNumberValid() && isReferresFullNameValid() && isReferresEmailFieldValid() && isReferresAgeValid() && isReferresPhoneNumberValid()
        {
            currentUser.friendsFullName = friendsFullNameTextField.text!
            currentUser.friendsEmail = friendsEmailTextField.text!
            currentUser.friendsAge = friendsAgeTextField.text!
            currentUser.friendsPhone = friendsPhoneNumberTextField.text!
            
            currentUser.referrersFullName = referrersFullNameTextField.text!
            currentUser.referrersEmail = referrersEmailTextField.text!
            currentUser.referrersAge = referrersAgeTextField.text!
            currentUser.referrersPhone = referrersPhoneNumberTextField.text!
            
            self.showReferralEmailAlert()
        }
        else
        {
            shakeTextFields()
        }
    }
    
    @IBAction func textFieldEditingDidChange(_ textField: SKTextField)
    {
        switch textField{
        case friendsFullNameTextField:
            friendsFullNameTextField.errorMessage = isFriendsFullNameValid() ? "" : "invalid Full Name"
            break
        case friendsEmailTextField:
            friendsEmailTextField.errorMessage = isFriendsEmailFieldValid() ? "" : "invalid email"
            break
        case friendsAgeTextField:
            friendsAgeTextField.errorMessage = isFriendsAgeValid() ? "" : "invalid age"
            break
        case friendsPhoneNumberTextField:
            friendsPhoneNumberTextField.errorMessage = isFriendsPhoneNumberValid() ? "" : "invalid phone number"
            break
        case referrersFullNameTextField:
            referrersFullNameTextField.errorMessage = isReferresFullNameValid() ? "" : "invalid Full Name"
            break
        case referrersEmailTextField:
            referrersEmailTextField.errorMessage = isReferresEmailFieldValid() ? "" : "invalid email"
            break
        case referrersAgeTextField:
            referrersAgeTextField.errorMessage = isReferresAgeValid() ? "" : "invalid age"
            break
        case referrersPhoneNumberTextField:
            referrersPhoneNumberTextField.errorMessage = isReferresPhoneNumberValid() ? "" : "invalid phone number"
            break
        default:
            break
        }
    }
    
    func configureMailComposeViewController() -> MFMailComposeViewController
    {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["seikendojo1@gmail.com"])
        mailComposerVC.setSubject("Referral!")
        
        mailComposerVC.setMessageBody("<p>Hello Sensei, <br>I'd like to refer the following indiviual to Seiken Martial Arts.</br></p> <b>My Friends Information:</b><br>Full Name: \(currentUser.friendsFullName)</br>Email address: \(currentUser.friendsEmail)<br>Age: \(currentUser.friendsAge)</br>Contact #: \(currentUser.friendsPhone)<p><b>My Information:</b><br>Full Name: \(currentUser.referrersFullName)</br>Email address: \(currentUser.referrersEmail)<br>Age: \(currentUser.referrersAge)</br>Contact #: \(currentUser.referrersPhone)</p> <p>Best regards,<br>\(currentUser.referrersFullName)</p>", isHTML: true)
        return mailComposerVC
    }
    
    func showMailError()
    {
        let sendMailErrorAlert: UIAlertController = UIAlertController(title: "Could not send email", message: "your device could not send email", preferredStyle: .alert)
        
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let emailError = error
        {
            let alert = AlertService.prepareFailureAlert(with: emailError, for: .sendReferral)
            present(alert, animated: true, completion: nil)
        }
        else
        {
            controller.dismiss(animated: true) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    // Mark: Referral Alert Service
    fileprivate func showReferralEmailAlert()
    {
        let alert = AlertService.referralSubmittionAlert()
        alert.addAction(withTitle: "Okay", style: .default){
            let mailComposeViewController = self.configureMailComposeViewController()
            if MFMailComposeViewController.canSendMail()
            {
                self.present(mailComposeViewController, animated: true, completion: nil)
            }else
            {
                self.showMailError()
            }
        }
        present(alert, animated: true, completion: nil)
    }
}
