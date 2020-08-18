//
//  GameListController.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 13.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage


protocol GameListContollerProtocol:BaseViewControllerProtocol {
    func displayList(with gameItems:[GamePresentationModel]) -> Void
    
}

public final class GameListController: BaseViewController{
    var service : GameListViewModelProtocol?
    var dataSource  = [GamePresentationModel]()
    var refresher = UIRefreshControl()
    var searchActive : Bool = false
    
    private let sectionInsets = UIEdgeInsets(top: 8,
                                             left: 0,
                                             bottom: 0,
                                             right: 0)
    private var collectionViewWidth:CGFloat?
    private var collectionViewHeight:CGFloat = 128
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        updateCollectionViewWidth(to: self.collectionView.frame.size)
        self.view.backgroundColor = UIColor.green
        service = GameListViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        service?.delegate = self
        searchBar.delegate = self;
        loadData(self)
        setRefresher()
        
    }
    
    //collectionview refresher
    func setRefresher() -> Void {
        self.collectionView!.alwaysBounceVertical = true
        self.refresher.tintColor = UIColor.red
        self.refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refresher.addTarget(self, action: #selector(loadData(_:)), for: .allEvents)
        self.collectionView!.addSubview(refresher)
    }
    @objc private func  loadData(_ sender: Any){
        if(type(of: sender) != type(of: sender)){
            self.collectionView!.refreshControl?.beginRefreshing()
            self.dataSource.removeAll()
        }
        service?.listGame()
        
    }
    
    
}



extension GameListController : GameListContollerProtocol {
    
    
    
    override func hideLoader() {
        if(refresher.isRefreshing){
            refresher.endRefreshing()
        }
        super.hideLoader()
    }
    
    func displayList(with gameItems:[GamePresentationModel]) -> Void{
        self.dataSource.append(contentsOf: gameItems)
        self.collectionView.reloadData()
        
    }
}
extension GameListController :UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     let gameDetailView =   GameDetailControllerBuilder.create(with: self.dataSource[indexPath.row])
        self.navigationController?.pushViewController(gameDetailView, animated: true)
    }
    
}

extension GameListController {
    //on rotate redraw collectionview with new insets
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        //update wiew after transition done
        coordinator.animate(alongsideTransition: nil) {[weak self] (_) in
            guard let self = self else { return }
            self.updateCollectionViewWidth(to: (self.collectionView.frame.size))
            self.collectionView.collectionViewLayout.invalidateLayout()
        }
        
    }
    //calculates collectionView width with horizantal1 vertical 2 columns
    public func updateCollectionViewWidth(to size:CGSize){
        
        var collectionItemCount:CGFloat = 1
        if size.width>size.height {
            collectionItemCount = CGFloat(appConfiguration.gameListVerticalColumnCount)
        } else {
            collectionItemCount = CGFloat(appConfiguration.gameListVerticalHorizantalCount)
        }
        let paddingSpace = sectionInsets.top * (collectionItemCount) * 2
        let availableWidth = (size.width - paddingSpace)
        collectionViewWidth = (availableWidth / collectionItemCount)
    }
}


//collectionview load more
extension GameListController {
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count-1 {
            service?.listNextPage()
        }
    }
}
//collection view data source implementation
extension GameListController :UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //if searchbar is active, display no game for startup
        if(searchActive == true && dataSource.count == 0) {
            collectionView.setEmptyView(title: "No game has been searched.", message: "")
            return dataSource.count
        }
        
        collectionView.restore() // remove no game message
        return dataSource.count
    }
    
    //cell implemantation.
    //todo: maybe cell presentation view can be usable
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameViewCell", for: indexPath) as! GameItemCell
        cell.lblTitle.text = item.gameName
        cell.lblGenre.text = item.genre
        cell.lblMetaCriticScore.text = item.metaCriticScore
        cell.imgCover.setImage(withUrl: item.backgroundImage, and: "defaultImage")
        return cell
    }
    
    
}

//set sections and column count. column count calculated via view width
extension GameListController : UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewWidth! , height: collectionViewHeight)
    }
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }
}


extension GameListController: UISearchBarDelegate {
    
    //when search began, clear data source, set search active and show no game message
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchActive = true
        self.dataSource.removeAll()
        self.collectionView.reloadData()
        
    }
    
    // after some search item count, first clear existing data for not to append, then search with new key
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.count >= appConfiguration.gameListSearchParameterCount){
            self.dataSource.removeAll()
            service?.listGame(search: searchText)
        }
    }
    //end editing. if no search result avaible, reload initial data
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        self.searchActive = false
        if(self.dataSource.count == 0){
            self.loadData(self)
        }
    }
    
}





