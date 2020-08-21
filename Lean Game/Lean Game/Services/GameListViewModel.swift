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
import UIKit

protocol GameListViewModelProtocol: class {
    var api :GameListServiceProtocol? {get set}
    func listGame(search key: String) -> Void
    func listGame() -> Void
    func listNextPage() -> Void
    var page : Int {get set}
    var delegate: GameListContollerProtocol? {get set}
    var fetchingNextPage : Bool {get set}
    var searchParam: String { get set }
    func isGameDetailOpened(with game:GamePresentationModel) -> Bool
    func setGameDetailOpened(with game: GamePresentationModel) -> Void
    func cellBackgroudColor(with game:GamePresentationModel) -> UIColor
}

extension GameListViewModelProtocol {
    
    func listGame(search key: String) {
        //if search key defined, set for next page
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
    private var detailOpenedGameList = [GamePresentationModel]()
    var searchParam: String = ""
    var fetchingNextPage: Bool = false
    var page: Int
    var delegate: GameListContollerProtocol?
    var api: GameListServiceProtocol?
    
    init() {
        page = 1
    }
    
    func listNextPage() -> Void {
        if fetchingNextPage == true {
            return
        }
        fetchingNextPage = true
        self.delegate?.showLoader()
        api?.fetchGameList(nextPage(), take: 20, search: searchParam) {[weak self] (result) in
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
    func isGameDetailOpened(with game: GamePresentationModel) -> Bool {
        if detailOpenedGameList.firstIndex(of: game) != nil
        {
            return true
        }
        return false
    }
    
    func setGameDetailOpened(with game: GamePresentationModel) -> Void {
        if detailOpenedGameList.firstIndex(of: game) == nil
        {
            detailOpenedGameList.append(game)
        }
    }
    func cellBackgroudColor(with game: GamePresentationModel) -> UIColor {
        if(isGameDetailOpened(with: game)){
            return UIColor(red: 224.0/255.0, green: 224/255.0, blue: 224/255.0, alpha: 1)
        }
        return UIColor.clear
    }
}







