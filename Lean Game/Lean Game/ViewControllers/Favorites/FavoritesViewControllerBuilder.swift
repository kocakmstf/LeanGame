//
//  FavoritesViewControllerBuilder.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
class FavoritesViewControllerBuilder{
static func create() -> FavoritesViewController {
    let storyboard = UIStoryboard(name: "FavoritesView", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
    

    return viewController
    }
}
