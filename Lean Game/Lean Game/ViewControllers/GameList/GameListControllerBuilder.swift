//
//  GameListControllerBuilder.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
import LeanApi

final class GameListControllerBuilder {
    static func create() -> GameListController {
        let storyboard = UIStoryboard(name: "GameListView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameListController") as! GameListController
        viewController.service = GameListViewModel()
        viewController.service?.api =
            GameListServiceApi(appConfiguration.environment)
    
    
        return viewController
    }
}
