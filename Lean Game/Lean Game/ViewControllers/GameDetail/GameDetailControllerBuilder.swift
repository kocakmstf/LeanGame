
//
//  GameDetailControllerBuilder.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
import LeanApi
final class GameDetailControllerBuilder{
    static func create(with game:GamePresentationModel) -> GameDetailViewController {
        let storyboard = UIStoryboard(name: "GameDetailView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameDetailViewContoller") as! GameDetailViewController
        viewController.service = GameDetailViewModel()
        viewController.service?.api = GameListServiceApi(appConfiguration.environment)
        viewController.service?.favoriteApi = FavoriteService()
        viewController.game = game
        
        return viewController
    }
}
