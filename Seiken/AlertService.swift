//
//  AlertService.swift
//  Seiken
//
//  Created by Shahin on 2017-10-07.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation

class AlertService
{
    typealias alertUtilityKey = Constants.AlertService
    
    //MARK: - NonMembers
    
    static func presentNonmembersAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Only memebrs have accesss to this feature", message: "Sorry!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
 
    // MARK: - Generic
    static func prepareImageSelectorAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Please Select Image Source", message: "", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    // MARK: - Profile
    static func presentDisabledFeatureAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Woops!", message: "This feature has not yet been implemented.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
        alert.addAction(okayAction)
        
        return alert
    }
    
    static func prepareSingoutAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Are you sure", message: "you want to sing out?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "NO", style: .destructive, handler: nil)
        alert.addAction(noAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    // MARK: - Signup / Signin
    static func prepareForgotPasswordAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Pssst!", message: "Check your inbox for an email from us with further instructions on how to reset your password.", preferredStyle: .alert)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func addBlurEffectTo(_ view: UIView)
    {
        var blurEffect = UIBlurEffect()
        if #available(iOS 10.0, *) {
            blurEffect = UIBlurEffect(style: .prominent)
        } else {
            blurEffect = UIBlurEffect(style: .extraLight)
        }
        let blureVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blureVisualEffectView.frame = view.bounds
        view.addSubview(blureVisualEffectView)
    }
    
    static func prepareSuccessfulSignupAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Oh Yeah!", message: "You have successfully signed up and are ready for sing in. Your email and password have been filled in for you from the previous screen.\nPlease proceed by tapping on the 'Sign in' button.", preferredStyle: .alert)
        alert.addAction(withTitle: "Okay", style: .default, handler: nil)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func prepareResendEmailVerificiationAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Uh oh!", message: "Seems like you have not yet verified your email address.\nFind the verification email in your mailbox or JUNK mail  \n\nOR", preferredStyle: .alert)
        alert.addAction(withTitle: "Cancel", style: .cancel, handler: nil)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func prepareFailureAlert(with error: Error, for alertType: FailureAlertType) -> UIAlertController
    {
        let alert = UIAlertController(title: "Uh Oh!", message: "Seems like there was an error while \(alertType.rawValue).\n\n\(error.localizedDescription)\n\nPlease try again later.", preferredStyle: .alert)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    // MARK: - Rewards
    static func confirmAddNew() -> UIAlertController
    {
        let alert = UIAlertController(title: "Pssst!", message: "Are you sure you want to add this reward to your list?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(noAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func warnUserOfInsufficientPoints() -> UIAlertController
    {
        let alert = UIAlertController(title: "Ooops!", message: "You don't have any more points to redeem at the moment. Come back here when you've completed a few more of your todos.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okayAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func prepareNewRewardErrorAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Uh oh!", message: "Some fields may be empty!\n\nMake sure all 3 fields are filled out AND an image is picked before trying to save the new reward.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okayAction)
        
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    // MARK: - Todos
    static func confirmAddTodoToPersonalList() -> UIAlertController
    {
        let alert = UIAlertController(title: "Pssst!", message: "Are you sure you want to add this promise to your personal list?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(noAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func confirmSubmitPromiseToPersonalList() -> UIAlertController
    {
        let alert = UIAlertController(title: "Pssst!", message: "Are you sure you want to submit this promise to your personal list?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(noAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func prepareNewTodoErrorAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Uh oh!", message: "Some fields may be empty!\n\nMake sure all 4 fields are filled out, an image is picked AND a frequency is selected before trying to save the new todo.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okayAction)
        
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    // MARK: - Activities
    static func prepareNewStepAlert(with title: String) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func prepareNewActivityErrorAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Uh oh!", message: "Some fields may be empty!\n\nMake sure all 4 fields are filled out AND an image is picked before trying to save the new activity.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okayAction)
        
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    static func prepareMissingsActivityStepsAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Uh oh!", message: "There are no steps created for this activity yet!\n\nUse the + button to add some steps before attemtping to save this activity again.", preferredStyle: .alert)
        
        alert.addAction(withTitle: "Okay", style: .cancel, handler: nil)
        
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    // MARK: - Helpers
    fileprivate static func generateAttributedTitleAndMessage(for alert: UIAlertController)
    {
        let attributedTitle = NSAttributedString(string: alert.title!, attributes: [NSFontAttributeName: UIFont(name: ".SFUIDisplay-Bold", size: 16)!, NSForegroundColorAttributeName: UIColor.black])
        let attributedMessage = NSAttributedString(string: alert.message!, attributes: [NSFontAttributeName: UIFont(name: ".SFUIDisplay-Light", size: 15)!, NSForegroundColorAttributeName: UIColor.black])
        
        alert.setValue(attributedTitle, forKey: Constants.AlertService.attributedTitle)
        alert.setValue(attributedMessage, forKey: Constants.AlertService.attributedMessage)
        alert.view.tintColor = .black
    }
    // MARK: - Signup Alert
    static func signupSubmittionAlert() -> UIAlertController
    {
   
        let alert = UIAlertController(title: "Thanks for signing up!", message:"\nPlease check your mailbox for verification email.\n\nAfter you verify your email, come back here and sign in.", preferredStyle: .alert)
        
        alert.addAction(withTitle: "OK", style: .cancel, handler: nil)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }
    
    //MARK: - Referral Submittion Aler
    static func referralSubmittionAlert() -> UIAlertController
    {
        
        let alert = UIAlertController(title: "Thanks for your referral!", message: "", preferredStyle: .alert)
        generateAttributedTitleAndMessage(for: alert)
        
        return alert
    }

}
