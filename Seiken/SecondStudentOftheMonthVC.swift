//
//  SecondStudentOftheMonthVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-28.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class SecondStudentOftheMonthVC: UIViewController, UIScrollViewDelegate
{
    typealias keys = Constants.Firebase.Keys.StudentOfTheMonth
    typealias references = Constants.Firebase.References
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var studentOfTheMonthURL = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchFirebaseData()
    }
    
    fileprivate func fetchFirebaseData()
    {
        let studentOfTheMonthReference = Database.database().reference().child(references.studentOfTheMonth)
            studentOfTheMonthReference.observe(.value, with: { (snapshot) in
            let studentOfTheMonthDict = snapshot.value as? [String: String]
            self.nameLabel.text = studentOfTheMonthDict?[keys.name]
            guard let link = studentOfTheMonthDict?[keys.link], let imageURL = URL(string: link) else { return }
            self.imageView.sd_setShowActivityIndicatorView(true)
            self.imageView.sd_setIndicatorStyle(.gray)
            self.imageView.sd_setImage(with: imageURL, placeholderImage: nil, options: .cacheMemoryOnly, completed: nil)
        })
    }
    
    // MARK: - Scroll View Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
}
