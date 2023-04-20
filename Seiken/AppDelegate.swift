//
//  AppDelegate.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    // MARK: - Properties
    var window: UIWindow?
    
    // MARK: - Lifecycle
    override init()
    {
        super.init()
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        return true
    }
}
