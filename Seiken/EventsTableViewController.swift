//
//  EventsTableViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-26.
//  Copyright © 2017 98chimp. All rights reserved.
//


import UIKit
import Firebase
import SDWebImage

class EventsTableViewController: UITableViewController
{
    typealias keys = Constants.Firebase.Keys.Events
    typealias references = Constants.Firebase.References
    typealias segues = Constants.SegueIdentifiers
    
    // MARK: - Properties
    var events = [[String : String]]()
    var eventTitles = [String]()
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchFirebaseData()
        title = "Events"
    }
    
    fileprivate func fetchFirebaseData(){
        
        let eventsReference = Database.database().reference().child(references.events)
        eventsReference.observe(.value, with: { (snapshot) in
            
            self.events.removeAll()
            self.eventTitles.removeAll()
            
            for child in snapshot.children
            {
                let snap = child as? DataSnapshot
                
                guard let title = snap?.key else { return }
                self.eventTitles.append(title)
                
                guard let eventDict = snap?.value as? [String: String] else { return }
                self.events.append(eventDict)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return eventTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        cell.textLabel?.text = eventTitles[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let eventDict = events[indexPath.row]
        performSegue(withIdentifier: segues.toEventDetail, sender: eventDict)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == segues.toEventDetail
        {
            let destinationVC = segue.destination as? EventDetailVC
            if let eventDict = sender as? [String: String]
            {
                destinationVC?.eventDict = eventDict
            }
        }
    }
}


