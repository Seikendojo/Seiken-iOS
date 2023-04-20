//
//  VideosTableViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-24.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SafariServices

class VideosTableViewController: UITableViewController, SFSafariViewControllerDelegate {
    
    let videosArray = ["Kihon - Basic Techniques","Ido Geiko - Combinations","Kata - Form(Beginners)","Kata - Form(Intermediate)","Dachi - Stances","Kumite - Sparring","World Championship Tournament"]
    let videoIdentities = ["Kihon","Ido","Kata","Kata2","Dachi","Kumite","Tournament"]
    let videoLinks = ["https://www.youtube.com/embed/riTd2CzRGcs",
                      "https://www.youtube.com/embed/wGlQCoIkJK4",
                      "https://www.youtube.com/embed/1K0il_x6mtU",
                      "https://www.youtube.com/embed/VbxfaR2aYZ0",
                      "https://www.youtube.com/embed/xyV9cuM6JFQ",
                      "https://www.youtube.com/embed/8kVJsfjw-gA",
                      "https://www.youtube.com/embed/LOAY_KPvte8"]
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        cell.textLabel?.text = videosArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoLink = videoLinks[indexPath.row]
        if let videoURL = URL(string: videoLink)
        {
            let safariVC = SFSafariViewController(url: videoURL)
            safariVC.delegate = self
            safariVC.preferredBarTintColor = .skRed
            safariVC.preferredControlTintColor = .white
            present(safariVC, animated: true, completion: nil)
        }
    }
}

