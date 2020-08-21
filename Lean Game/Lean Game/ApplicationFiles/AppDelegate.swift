//
//  AppDelegate.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 9.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import UIKit


let  appConfiguration:AppConfigurationProtocol = ProductionConfiguration()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        app.router = TabbarRouter()
        app.router?.start()
        
        // Override point for customization after application launch.
        return true
    }
    
    
}

