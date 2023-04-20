//
//  ShinKyokushinViewController.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-12-10.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class ShinKyokushinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func contactUsTapped(_ sender: Any) {
        performSegue(withIdentifier: "toContactUs", sender: self)
    }
    
    
}
