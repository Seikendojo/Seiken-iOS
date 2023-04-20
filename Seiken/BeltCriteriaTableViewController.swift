//
//  BeltCriteriaTableViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-14.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

let beltsArray = ["White Belt","Orange Belt-Kyu 10","Orange Belt-Kyu 9","Blue Belt-Kyu 8","Blue Belt-Kyu 7","Yellow Belt-Kyu 6","Yellow Belt-Kyu 5", "Green Belt-Kyu 4","Green Belt-Kyu 3","Brown Belt-Kyu 2","Brown Belt-Kyu 1"]

let beltsImageArray = ["WB","Kyu10","Kyu9","Kyu8","Kyu7","Kyu6","Kyu5","Kyu4","Kyu3","Kyu2","Kyu1"]

var myIndex = 0

class BeltCriteriaTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beltsArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.beltCell, for: indexPath) as! BeltTableViewCell
        cell.configure(with: beltsArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: Constants.SegueIdentifiers.toBeltDetail, sender: self)
    }
}
