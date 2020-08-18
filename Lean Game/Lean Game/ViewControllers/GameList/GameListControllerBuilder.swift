//
//  GameListControllerBuilder.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit

final class GameListControllerBuilder {
    static func create() -> GameListController {
        let storyboard = UIStoryboard(name: "GameListControllerStoryBoard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameListController") as! GameListController
        viewController.service = GameListViewModel()
    
        return viewController
    }
}
