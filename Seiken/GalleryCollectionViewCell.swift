//
//  GalleryCollectionViewCell.swift
//  Seiken
//
//  Created by Shahin on 2017-11-25.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    
    // MARK: - Helpers
    func configure(with url: URL)
    {
        galleryImageView.sd_setShowActivityIndicatorView(true)
        galleryImageView.sd_setIndicatorStyle(.white)
        galleryImageView.sd_setImage(with: url, placeholderImage: nil, options: .cacheMemoryOnly, completed: nil)
    }
}
