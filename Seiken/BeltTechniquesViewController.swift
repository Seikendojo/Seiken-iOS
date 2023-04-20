//
//  BeltTechniquesViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-19.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class BeltTechniquesViewController: UIViewController, UIScrollViewDelegate
{
    
    var getImage = UIImage()
    
    @IBOutlet weak var beltImageView: UIImageView!
    @IBOutlet weak var titleBeltImageView: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
    }

    func configureView()
    {
        titleBeltImageView.image = UIImage(named: beltsImageArray[myIndex] )
        beltImageView.image = UIImage(named: beltsArray[myIndex] + ".pdf")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return beltImageView
    }
    
}
