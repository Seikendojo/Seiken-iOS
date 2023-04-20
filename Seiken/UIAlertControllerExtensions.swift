//
//  UIAlertControllerExtensions.swift
//  Seiken
//
//  Created by Shahin on 2017-10-07.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation

extension UIAlertController
{
    func show()
    {
        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?)
    {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController
        {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?)
    {
        if let navVC = controller as? UINavigationController, let visibleVC = navVC.visibleViewController
        {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        }
        else if let tabVC = controller as? UITabBarController, let selectedVC = tabVC.selectedViewController
        {
            presentFromController(controller: selectedVC, animated: animated, completion: completion)
        }
        else
        {
            controller.present(self, animated: animated, completion: completion);
        }
    }
    
    func addAction(withTitle title: String?, style: UIAlertActionStyle = .default, handler: (() -> Void)? = nil)
    {
        addAction(UIAlertAction(title: title, style: style, handler: { _ in
            handler?()
        }))
    }
}
