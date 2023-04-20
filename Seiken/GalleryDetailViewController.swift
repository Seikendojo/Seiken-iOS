//
//  GalleryDetailViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-11-25.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryDetailViewController: UIViewController, UIScrollViewDelegate
{
    // MARK: - Outlets
    @IBOutlet weak var galleryImageView: UIImageView!
    
    // MARK: - Property
    var detailImageURL: URL?
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Helpers
    func configureView()
    {
        galleryImageView.sd_setShowActivityIndicatorView(true)
        galleryImageView.sd_setIndicatorStyle(.white)
        galleryImageView.sd_setImage(with: detailImageURL, placeholderImage: nil, options: .refreshCached) { [unowned self] (image, error, cacheType, url) in
            if let downloadError = error
            {
                print(downloadError.localizedDescription)
            }
            else
            {
                if let height = image?.size.height, let width = image?.size.width
                {
                    self.galleryImageView.contentMode = height > width ? .scaleAspectFill : .scaleAspectFit
                }
                print("cache type is: \(cacheType)")
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Scroll View Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return galleryImageView
    }
}
