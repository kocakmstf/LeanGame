//
//  Router.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 13.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit

protocol RouterProtocol {
    var window : UIWindow? {get}
    func start() -> Void
}


final class TabbarRouter:RouterProtocol {
    
    var window: UIWindow?
    var tabBarController : UITabBarController
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        tabBarController = TabBarController()
    }
    
    func start() -> Void {
        

        
    
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }
 
}

final class TabBarController:UITabBarController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         initViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func initViews() -> Void {
         tabBarController?.view.backgroundColor = UIColor.red
           tabBarController?.viewControllers = [UIViewController]()
         let gamelistController = GameListControllerBuilder.create()
        gamelistController.title = "Games"
         let gameNavigationContainer = UINavigationController(rootViewController: gamelistController)
         gamelistController.tabBarItem = UITabBarItem(
                    title: "Games",
                    image: UIImage(named: "gamesBarIcon"),
                    selectedImage: nil)
        
        let favoritesController = FavoritesViewControllerBuilder.create()
               let favoritesNavigationContainer = UINavigationController(rootViewController: favoritesController)
               favoritesController.tabBarItem = UITabBarItem(
                          title: "Favorites",
                          image: UIImage(named: "favoritesBarIcon"),
                          selectedImage: nil)
              
        self.viewControllers = [gameNavigationContainer,favoritesNavigationContainer]
         
         
         
     }
}

let app = AppContainer()

final class AppContainer {
    var  router : RouterProtocol?
   
}
