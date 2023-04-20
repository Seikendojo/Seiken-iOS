//
//  PartyVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-26.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class PartyVC: UIViewController,UIScrollViewDelegate
{
    
    @IBOutlet weak var partyImage: UIImageView!
    var upcomingPartyURL = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingPartyURL = ["https://firebasestorage.googleapis.com/v0/b/seiken-5e6e0.appspot.com/o/upcomingParties%2FcomingSoon.png?alt=media&token=e3ad539f-f7c1-4d3c-8992-b79582be643e"]
        
        partyImage.image = partyImage.sd_setImage(with: URL(string: upcomingPartyURL[0])) as? UIImage
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return partyImage
    }
    
}
