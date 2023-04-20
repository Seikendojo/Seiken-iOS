//
//  StudentOfTheMonthVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-28.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class StudentOfTheMonthVC: UIViewController
{
    @IBAction func whoIsItAction(_ sender: Any)
    {
        self.performSegue(withIdentifier: "SecondStudentView", sender: self)
    }
}
