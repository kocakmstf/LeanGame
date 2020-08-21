//
//  FavoritesViewController.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
protocol FavoritesControllerProtocol:BaseViewControllerProtocol {
    func displayList(with gameItems:[GamePresentationModel]) -> Void
    func updateTitle() -> Void
    func inserted(toFavorites model:GamePresentationModel) -> Void
    func removed(fromFavorites model:GamePresentationModel) -> Void
    var favoriteService : FavoritesViewModelProtocol? {get set}
    
}

final class FavoritesViewController:BaseViewController{
    var dataSource = [GamePresentationModel]()
    var favoriteService : FavoritesViewModelProtocol?
    
    @IBOutlet weak var tblFavorites: UITableView!
    
    override func viewDidLoad() {
        favoriteService?.delegate = self
        favoriteService?.listGames()
        self.tblFavorites.delegate = self
        self.tblFavorites.dataSource = self
    }

    
}
extension FavoritesViewController :FavoritesControllerProtocol{
    func displayList(with gameItems: [GamePresentationModel]) {
        self.dataSource = gameItems
        self.tblFavorites.reloadData()
    }
    func updateTitle() {
        self.title = "Favorites(\(dataSource.count))"
        self .setEmptyBackground()
    }
    func setEmptyBackground() -> Void {
        if(self.tblFavorites != nil){
                   if(dataSource.count == 0)
                   {
                       self.tblFavorites.setEmptyView(title: "There is no favourites found.", message: "")
                   }
                   else{
                       self.tblFavorites.restore()
                   }
               }
    }
    
    func inserted(toFavorites model: GamePresentationModel) {
        self.dataSource.append(model)
        self.tblFavorites.beginUpdates()
        tblFavorites.insertRows(at: [IndexPath(row: dataSource.count-1, section: 0)], with: .automatic)
        tblFavorites.endUpdates()
    }
    
    func removed(fromFavorites model: GamePresentationModel) {
        if let rowIndex = self.dataSource.firstIndex(of: model) {
            self.dataSource.remove(at: rowIndex)
             self.tblFavorites.beginUpdates()
            self.tblFavorites.deleteRows(at: [IndexPath(row: rowIndex, section: 0)], with: .automatic)
            tblFavorites.endUpdates()
        }
        
    }
}

extension FavoritesViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let game = dataSource[indexPath.row]
            let alertController = UIAlertController(
                title: "Removing!",
                message:"Game will be removed from your favorites. Do you want to continue?",
                preferredStyle: .alert
            )
            alertController.addAction(
                UIAlertAction(title: "Yes", style: .destructive) { (action) in
                    self.favoriteService?.UnFavorite(the: game)
                }
            )
            alertController.addAction(UIAlertAction(title: "No", style: .cancel))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
}
extension FavoritesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! FavoritesTableViewCell
        cell.imgCover.setImage(withUrl: game.backgroundImage, and: "defaultImage")
        cell.lblGenre.text = game.genre
        cell.lblMetaCriticScore.text = game.metaCriticScore
        cell.lblTitle.text = game.gameName
        
        return cell
    }
    
    
}

final class FavoritesTableViewCell:UITableViewCell{
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMetaCriticScore: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
}
