//
//  GameDetailViewModel.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
import LeanApi

protocol GameDetailViewModelProtocol: class {
    var api :GameListServiceProtocol {get}
    func getGame(with id: Int) -> Void
    var delegate: GameDetailContollerProtocol? {get set}
    
}


class GameDetailViewModel:GameDetailViewModelProtocol {
    var api: GameListServiceProtocol
    
    var delegate: GameDetailContollerProtocol?
    
    init() {
          api = GameListServiceApi(appConfiguration.environment)
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
            case .failure (let error):
                self.delegate?.showErrorMessage("Error Occured:#\(error.localizedDescription)")
            }
        }
    }
  
    
    
    
    
}
