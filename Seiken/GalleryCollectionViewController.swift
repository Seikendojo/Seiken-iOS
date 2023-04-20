//
//  GalleryCollectionViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-11-25.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import FirebaseDatabase

class GalleryCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    typealias references = Constants.Firebase.References
    
    // MARK: - Outlets
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    // MARK: - Properties
    var galleryThumbnailURLs = [URL]()
    var galleryPhotoURLs = [URL]()
    override var prefersStatusBarHidden: Bool { return false }
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
        configureDataSource()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Helpers
    fileprivate func configureDataSource()
    {
        // thumbnail URLs for the gallery
        getThumbnailURLs()
    }
    
    fileprivate func getThumbnailURLs()
    {
        let galleryThumbnailsReference = Database.database().reference().child(references.galleryThumbnails)
        galleryThumbnailsReference.observe(.value, with: { [unowned self] (snapshot) in
            let urlDict = snapshot.value as? [String: Any]
            guard let imageNames = urlDict?.keys else { return }
            let sortedImageNames = imageNames.sorted { $0.compare($1, options: .numeric) == .orderedAscending }
            for imageName in sortedImageNames
            {
                guard let urlString = urlDict?[imageName] as? String else { return }
                guard let imageURL = URL(string: urlString) else { return }
                self.galleryThumbnailURLs.append(imageURL)
                
                // actual image URLs for detail view
                self.getPhotoURLs()
            }
        })
    }
    
    fileprivate func getPhotoURLs()
    {
        let galleryPhotosReference = Database.database().reference().child(references.galleryPhotos)
        galleryPhotosReference.observe(.value, with: { [unowned self] (snapshot) in
            let photoURLsDict = snapshot.value as? [String: Any]
            guard let imageNames = photoURLsDict?.keys else { return }
            let sortedImageNames = imageNames.sorted { $0.compare($1, options: .numeric) == .orderedAscending }
            for imageName in sortedImageNames
            {
                guard let urlString = photoURLsDict?[imageName] as? String else { return }
                guard let photoURL = URL(string: urlString) else { return }
                self.galleryPhotoURLs.append(photoURL)
            }
            self.galleryCollectionView.reloadData()
        })
    }
    
    fileprivate func configureView()
    {
        navigationController?.navigationBar.barTintColor = .black
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Constants.SegueIdentifiers.toGalleryDetail
        {
            let destinationVC = segue.destination as? GalleryDetailViewController
            guard let selectedImageURL = sender as? URL else { return }
            destinationVC?.detailImageURL = selectedImageURL
        }
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return galleryThumbnailURLs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReuseIdentifiers.galleryCell, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        let imageURL = galleryThumbnailURLs[indexPath.item]
        cell.configure(with: imageURL)
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        galleryCollectionView.deselectItem(at: indexPath, animated: true)
        let selectedPhotoURL = galleryPhotoURLs[indexPath.item]
        performSegue(withIdentifier: Constants.SegueIdentifiers.toGalleryDetail, sender: selectedPhotoURL)
    }
    
    // MARK: - Collection View Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let numberOfItems: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 5.0 : 3.0
        let margin = CGFloat((numberOfItems + 1) * 5)
        let itemWidth = (galleryCollectionView.bounds.width - margin) / numberOfItems
        let itemHeight = itemWidth
        let itemsize = CGSize(width: itemWidth, height: itemHeight)
        return itemsize
    }
}
