//
//  AppDelegate.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 9.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if #available(iOS 13.0, *) {
            window?.rootViewController = storyBoard.instantiateViewController(identifier: "ViewController")
        } else {
            // Fallback on earlier versions
        }
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }
    
    
}

