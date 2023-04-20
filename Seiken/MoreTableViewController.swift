//
//  MoreTableViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-30.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import Firebase

class MoreTableViewController: UITableViewController {
    
    // MARK: - Properties
    var moreArray: [String] = ["Gallery","Logout"]
    let moreIdentities = ["Gallery","Logout"]
    let currentUser = User.current
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool)
    {
        navigationController?.navigationBar.barTintColor = .skRed
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return moreArray.count
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = moreArray[indexPath.row]

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 1:
            do {
                try  Auth.auth().signOut()
                SessionService.removeUserToken()
                currentUser.password = ""
                dismiss(animated: true, completion: nil)
                
            } catch {
                print("There was a problem logging out")
            }
       
        default:
            performSegue(withIdentifier: Constants.SegueIdentifiers.toGallery, sender: self)
        }
     }
}







