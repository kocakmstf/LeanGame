//
//  UnitOfWork.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 21.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
import LeanApi


//TODO: may be replaced by dynamic dependency injection library
public final class ServiceUnitOfWork {
    static  var favoriteService:FavoriteServiceProtocol = FavoriteService()
    static  var favoriteViewModel: FavoritesViewModelProtocol = FavoritesViewModel()
    static var gameDetailViewModel: GameDetailViewModelProtocol = GameDetailViewModel()
    static var gameListViewModel: GameListViewModelProtocol = GameListViewModel()
    
    static var gameListService: GameListServiceProtocol = GameListServiceApi(appConfiguration.environment)
    
}
