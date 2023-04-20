//
//  MembersViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-10.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SafariServices
import Firebase


class MembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    typealias segues = Constants.SegueIdentifiers
    typealias refs = Constants.Firebase.References
    
    // MARK: - Outlets
    @IBOutlet weak var signinbutton: UIBarButtonItem!
    
    // MARK: - Properties
    var currentUser = User.current
    let usersReference = Database.database().reference(withPath: refs.users)
    
    // MARK: - String array of data
    let membersData = ["Programs", "Belt Criteria","Videos","Terminology","Refer a friend","Events","Student of the month","Goal setter","How to tie our belt","Schedule","Contact us","Gallery"]
    
    // MARK: - String array of subtitles
    let membersSubs = ["Existing Programs","Belt techniques","Kihon,Kata,Kumite","Japanese terminology","Share the art","Seiken events","Seiken student of the month","Set a goal","Instruction","Seiken Schedule","",""]
    
    // MARK: - Strin array of segue identifiers
    let segueIdentifiers = [segues.toPrograms, segues.toBeltDetail, segues.toVideos, segues.toTerminology, segues.toReferral, segues.toEvents, segues.toStudent, segues.toGoalSetter, segues.toTieBelt, segues.toSchedule, segues.toContact, segues.toGallery]
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUserModel()
    }
 
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        determineSigninButtonState()
        navigationController?.navigationBar.barTintColor = .skRed
        updateUserModel()
    }
    
    // MARK: - Helpers
    fileprivate func determineSigninButtonState()
    {
        signinbutton.title = currentUser.userID != nil ? "Sign Out" : "Sign In"
    }
    
    fileprivate func showSignoutAlert()
    {
        let alert = UIAlertController(title: "Alert!", message: "Are you sure you want to sign out?", preferredStyle: .alert)
        alert.addAction(withTitle: "No", style: .cancel, handler: nil)
        alert.addAction(withTitle: "Yes", style: .default) {
            try? Auth.auth().signOut()
            SessionService.removeUserToken()
            User.current = User()
            self.currentUser = User()
            self.signinbutton.title = "Sign In"
            self.title = ""
        }
        present(alert, animated: true, completion: nil)
    }
    
    //Mark: - Change status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions
    @IBAction func singinTapped(_ sender: UIBarButtonItem)
    {
        if currentUser.userID != nil
        {
            showSignoutAlert()
        }
        else
        {
            performSegue(withIdentifier: segues.toSignin, sender: self)
        }
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return membersData.count
    }
   
    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CustomMemberCell
        let title = membersData[indexPath.row]
        let subtitle = membersSubs[indexPath.row]
        
        cell.configure(with: title, andSubtitle: subtitle)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.row {
        case 1, 2, 5, 6, 11:
            if currentUser.seikenUserRole == .nonmember
            {
                present(AlertService.presentNonmembersAlert(), animated: true, completion: nil)
            }
            else
            {
                performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: self)
            }
            
        case 7:
            present(AlertService.presentDisabledFeatureAlert(), animated: true, completion: nil)
            
        case 8:
            let videoLink = "https://www.youtube.com/embed/AUoSApwcWOw"
            if let videoURL = URL(string: videoLink)
            {
                let safariVC = SFSafariViewController(url: videoURL)
                safariVC.delegate = self as? SFSafariViewControllerDelegate
                safariVC.preferredBarTintColor = .skRed
                safariVC.preferredControlTintColor = .white
                present(safariVC, animated: true, completion: nil)
            }
            
        default:
            performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: - Firebase
    func updateUserModel()
    {
        let userRef = usersReference.child(SessionService.retriveUserToken())
        userRef.observe(.value, with: { snapshot in
            self.currentUser.parse(snapshot)
            self.determineSigninButtonState()
            guard let name = self.currentUser.firstName else { return }
            self.title = "Hi \(name)"
        })
    }
}






