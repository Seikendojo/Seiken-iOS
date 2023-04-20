//
//  EventsVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-26.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import FirebaseDatabase


class EventDetailVC: UIViewController, UIScrollViewDelegate {
    
    typealias keys = Constants.Firebase.Keys.Events
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventLabel: UILabel!
    
    var eventDict: [String: String]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView()
    {
        eventLabel.text = eventDict?[keys.title]
        guard let link = eventDict?[keys.link], let imageURL = URL(string: link) else { return }
        eventImageView.sd_setShowActivityIndicatorView(true)
        eventImageView.sd_setIndicatorStyle(.gray)
        eventImageView.sd_setImage(with: imageURL, placeholderImage: nil, options: .cacheMemoryOnly, completed: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return eventImageView
    }
}
