//
//  SeminarVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-26.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class ClosureVC: UIViewController, UIScrollViewDelegate {
    
    typealias references = Constants.Firebase.References
    typealias keys = Constants.Firebase.Keys.Events
    
    @IBOutlet weak var closureImage: UIImageView!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchImageFromFirebase()
    }
    
    fileprivate func fetchImageFromFirebase()
    {
        let eventsReference = Database.database().reference().child(references.events)
        eventsReference.observe(.value, with: { [unowned self] (snapshot) in
            let eventsDict = snapshot.value as? [String: String]
            guard let link = eventsDict?[keys.upcomingClosure], let imageURL = URL(string: link) else { return }
            self.closureImage.sd_setShowActivityIndicatorView(true)
            self.closureImage.sd_setIndicatorStyle(.gray)
            self.closureImage.sd_setImage(with: imageURL, placeholderImage: nil, options: .cacheMemoryOnly, completed: nil)
        })
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return closureImage
    }
}
