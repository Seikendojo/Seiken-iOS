//
//  TerminologyPDFVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-24.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class TerminologyPDFVC: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var TerminologyImage: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return TerminologyImage
    }
  
 
}
