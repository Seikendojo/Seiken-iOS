//
//  WelcomePageViewController.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource
{
    fileprivate typealias storyboardID = Constants.Storyboards
    fileprivate typealias viewController = Constants.ViewControllers
    
    lazy var welcomeViewControllers: [UIViewController] =
        {
            return [self.createViewControllerInstance(with: viewController.welcome1),
                    self.createViewControllerInstance(with: viewController.welcome2),
                    self.createViewControllerInstance(with: viewController.welcome3),
                    self.createViewControllerInstance(with: viewController.welcome4),
                    self.createViewControllerInstance(with: viewController.welcome5)
            ]
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = welcomeViewControllers.first
        {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        for view in view.subviews
        {
            if view is UIScrollView
            {
                view.frame = UIScreen.main.bounds
            }
            else if view is UIPageControl
            {
                let newCenter = CGPoint(x: view.center.x, y: self.view.bounds.height - 75)
                view.center = newCenter
                view.backgroundColor = .clear
            }
        }
    }
    
    // MARK: - Data Source
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return welcomeViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = welcomeViewControllers.index(of: firstViewController) else { return 0 }
        return firstViewControllerIndex
    }
    
    // MARK: - Delegate
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let vcIndex = welcomeViewControllers.index(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        guard  previousIndex >= 0 else { return nil }
        guard  welcomeViewControllers.count > previousIndex else { return nil }
        
        return welcomeViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let vcIndex = welcomeViewControllers.index(of: viewController) else { return nil }
        let nextIndex = vcIndex + 1
        guard  welcomeViewControllers.count != nextIndex else { return nil }
        guard  welcomeViewControllers.count > nextIndex else { return nil }
        
        return welcomeViewControllers[nextIndex]
    }
    
    // MARK: - Helpers
    func createViewControllerInstance(with viewControllerName: String) -> UIViewController
    {
        return UIStoryboard(name: storyboardID.welcome, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerName)
    }
}
