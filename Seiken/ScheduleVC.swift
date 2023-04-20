//
//  ScheduleVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-27.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController, UIScrollViewDelegate
{
    @IBOutlet weak var scheduleImageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return scheduleImageView
    }
}
