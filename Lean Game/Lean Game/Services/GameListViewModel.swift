//
//  GameListService.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
import LeanApi

protocol GameListViewModelProtocol: class {
    var api :GameListServiceProtocol {get}
    func listGame(search key: String) -> Void
    func listGame() -> Void
     func listNextPage() -> Void
    var page : Int {get set}
    var delegate: GameListContollerProtocol? {get set}
    var fetchingNextPage : Bool {get set}
    var searchParam: String { get set }
    
    
}

extension GameListViewModelProtocol {
    
    func listGame(search key: String) {
           searchParam = key
           page = 0
           listNextPage()
       }
    func listGame() -> Void {
        searchParam = ""
        page = 0
        listNextPage()
    }
    
    func nextPage() -> Int {
        self.page = page + 1
        return page
    }
    
}

class GameListViewModel:GameListViewModelProtocol {
   
    
    var searchParam: String = ""
    
    var fetchingNextPage: Bool = false
    var page: Int
    var delegate: GameListContollerProtocol?
    var api: GameListServiceProtocol
    
    init() {
        api = GameListServiceApi(appConfiguration.environment)
        page = 1
    }
    
    func listNextPage() -> Void {
        if fetchingNextPage == true {
            return
        }
        fetchingNextPage = true
         self.delegate?.showLoader()
        api.fetchGameList(nextPage(), take: 20, search: searchParam) {[weak self] (result) in
            guard let self = self else { return }
            self.fetchingNextPage = false
            self.delegate?.hideLoader()
            switch result{
            case .success(let value):
                if let gameList = value.results {
                    let gamesPresentations = gameList.map({GamePresentationModel(with: $0)})
                    self.delegate?.displayList(with: gamesPresentations)
                }
                else
                {
                    self.delegate?.showErrorMessage("No Games Found")
                }
            case .failure (let error):
                self.delegate?.showErrorMessage("Error Occured:#\(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    
}







