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
    var tabBarController : UITabBarController?
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() -> Void {
        tabBarController = TabBarController()
        initViews()
        
        let storyBoard = UIStoryboard.init(name: "GameListControllerStoryBoard", bundle: nil)
        let gameListView = storyBoard.instantiateViewController(withIdentifier: "GameListController")
        
        window?.rootViewController = gameListView
        window?.makeKeyAndVisible()
        
    }
    func initViews() -> Void {
        tabBarController?.view.backgroundColor = UIColor.red
        
        
        
        
    }
}

final class TabBarController:UITabBarController{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard = UIStoryboard.init(name: "GameListControllerStoryBoard", bundle: nil)
        tabBarController?.viewControllers = [UIViewController]()
        let gameListView = storyBoard.instantiateViewController(withIdentifier: "GameListController")
        let gameListView2 = storyBoard.instantiateViewController(withIdentifier: "GameListController")
        
        let navController = UINavigationController(rootViewController: gameListView)
        let navController2 = UINavigationController(rootViewController: gameListView2)
        navController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        navController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        tabBarController?.viewControllers?.append(navController)
        tabBarController?.viewControllers?.append(navController2)
        
        
    }
}

let app = AppContainer()

final class AppContainer {
    var  router : RouterProtocol?
}
