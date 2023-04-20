//
//  TournamentVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-26.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class TournamentVC: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var TournamentImage: UIImageView!
    
    var upcomingTournamentURL = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingTournamentURL = ["https://firebasestorage.googleapis.com/v0/b/seiken-5e6e0.appspot.com/o/upcomingTournament%2FcomingSoon.png?alt=media&token=668e09c8-3092-4c27-9286-79830f973313"]
        
        TournamentImage.image = TournamentImage.sd_setImage(with: URL(string: upcomingTournamentURL[0])) as? UIImage
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return TournamentImage
    }
    
    
}
