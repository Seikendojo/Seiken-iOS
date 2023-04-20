//
//  MovieNightVC.swift
//  Seiken
//
//  Created by SIAMAK POURHABIB on 2017-10-26.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SDWebImage

class MovieNightVC: UIViewController,UIScrollViewDelegate
{

    @IBOutlet weak var movieNIghtImage: UIImageView!
    
    var upcomingMovieNightURL = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingMovieNightURL = ["https://firebasestorage.googleapis.com/v0/b/seiken-5e6e0.appspot.com/o/upcomingMovieNight%2FMovieNightImage.png?alt=media&token=21a5d46c-f104-4159-ad3a-d64b406611fc"]
        
        movieNIghtImage.image = movieNIghtImage.sd_setImage(with: URL(string: upcomingMovieNightURL[0])) as? UIImage
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return movieNIghtImage
    }
    
}
