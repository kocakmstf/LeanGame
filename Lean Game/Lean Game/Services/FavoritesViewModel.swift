//
//  FavoritesViewModel.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 20.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation

protocol FavoritesViewModelProtocol {
    func listGames() -> Void
    func UnFavorite(the game:GamePresentationModel) -> Void
    var delegate:FavoritesControllerProtocol? {get set}
    
}

public class FavoritesViewModel:FavoritesViewModelProtocol{
    var delegate:FavoritesControllerProtocol?
    var service : FavoriteServiceProtocol?
    init() {
        service = FavoriteService()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addToFavorites(notification:)), name: NSNotification.Name(rawValue: NotificationNameConstants.addFavorites), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removedFavorites(notification:)), name: NSNotification.Name(rawValue: NotificationNameConstants.removedFavorites), object: nil)
    }
    @objc func addToFavorites(notification: Notification){
        let model = notification.object as! GamePresentationModel
        delegate?.inserted(toFavorites: model)
        delegate?.updateTitle()
        
    }
    @objc func removedFavorites(notification: Notification){
        let model = notification.object as! GamePresentationModel
        delegate?.removed(fromFavorites: model)
        delegate?.updateTitle()
    }
    func listGames() -> Void {
        delegate?.displayList(with: service?.gameList() ?? [GamePresentationModel]())
        delegate?.updateTitle()
    }
    func UnFavorite(the game:GamePresentationModel) -> Void {
        _ = service?.unFavorite(game)
    }
}
