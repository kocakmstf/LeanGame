//
//  FavoriteService.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
protocol FavoriteServiceProtocol {
    func gameList() -> [GamePresentationModel]
    func favorite(_ game:GamePresentationModel) -> Bool
    func unFavorite(_ game:GamePresentationModel) -> Bool
    func isFavorite(_ game:GamePresentationModel) -> Bool
}

//favorite service static data implementation
class FavoriteService:FavoriteServiceProtocol {
    private static var models = [GamePresentationModel]()
    func gameList() -> [GamePresentationModel] {
        return FavoriteService.models
    }
    func favorite(_ game:GamePresentationModel) -> Bool {
        FavoriteService.models.append(game)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationNameConstants.addFavorites), object: game)
        return true
    }
    
    
    func unFavorite(_ game:GamePresentationModel) -> Bool {
        var unfavoriteSuccessfull = false
        if let indice = FavoriteService.models.firstIndex(of: game)
        {
            FavoriteService.models.remove(at: indice)
            unfavoriteSuccessfull = true
            
        }
        if(unfavoriteSuccessfull){
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationNameConstants.removedFavorites), object: game)
        }
        return unfavoriteSuccessfull
    }
    
    func isFavorite(_ game:GamePresentationModel) -> Bool {
        if FavoriteService.models.firstIndex(of: game) != nil
        {
            return true
        }
        return false
    }
}

