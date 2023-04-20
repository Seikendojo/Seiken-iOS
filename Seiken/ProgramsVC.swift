//
//  ProgramsVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-30.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class ProgramsVC: UIViewController
{
    @IBAction func ShinkyokushinBtnTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: "Shinkyokushin", sender: self)
    }
    
    @IBAction func MiniKarateBtnTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: "MiniKarate", sender: self)
    }
    
    @IBAction func KickboxingBtnTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: "Kickboxing", sender: self)
    }
}












