//
//  GameDetailViewModel.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
import LeanContract
import LeanApi


protocol GameDetailViewModelProtocol: class {
    var api :GameListServiceProtocol {get}
    func getGame(with id: Int) -> Void
    var delegate: GameDetailContollerProtocol? {get set}
    func openUrl(with urlString:String) -> Void
    func isFavorite(_ game:GamePresentationModel) -> Bool
    
    func favorite(_ game:GamePresentationModel) -> Bool
    func unFavorite(_ game:GamePresentationModel) -> Bool
    
}


class GameDetailViewModel:GameDetailViewModelProtocol {
    var api: GameListServiceProtocol
    var favoriteApi : FavoriteServiceProtocol
    var delegate: GameDetailContollerProtocol?
    
    init() {
        api = GameListServiceApi(appConfiguration.environment)
        favoriteApi = FavoriteService()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addToFavorites(notification:)), name: NSNotification.Name(rawValue: NotificationNameConstants.addFavorites), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removedFavorites(notification:)), name: NSNotification.Name(rawValue: NotificationNameConstants.removedFavorites), object: nil)
    }
    @objc func addToFavorites(notification: Notification){
        delegate?.updateBtnFavoriteTitle(true)
        
    }
    @objc func removedFavorites(notification: Notification){
        delegate?.updateBtnFavoriteTitle(false)
    }
    func getGame(with id: Int) {
        self.delegate?.showLoader();
        api.fetchGameDetail(with: id) { [weak self] (result) in
            guard let self = self else { return }
            self.delegate?.hideLoader()
            switch result{
            case .success(let value):
                
                let game = GamePresentationModel(with: value)
                self.delegate?.displayGame(with: game)
                self.delegate?.updateBtnFavoriteTitle(self.favoriteApi.isFavorite(game))
            case .failure (let error):
                self.delegate?.showErrorMessage("Error Occured:#\(error.localizedDescription)")
            }
        }
    }
    func openUrl(with urlString:String) -> Void {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    func favorite(_ game: GamePresentationModel) -> Bool {
        return favoriteApi.favorite(game)
    }
    
    func unFavorite(_ game: GamePresentationModel) -> Bool {
        return favoriteApi.unFavorite(game)
    }
    
    func isFavorite(_ game: GamePresentationModel) -> Bool {
        return favoriteApi.isFavorite(game)
    }
    
    
    
    
    
}
