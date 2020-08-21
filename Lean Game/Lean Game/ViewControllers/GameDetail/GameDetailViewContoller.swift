//
//  GameDetailViewContoller.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit

protocol GameDetailContollerProtocol:BaseViewControllerProtocol {
    func displayGame(with game:GamePresentationModel) -> Void
    func updateBtnFavoriteTitle(_ isFavorite:Bool) -> Void 
}
final class GameDetailViewController:BaseViewController
{
    @IBOutlet weak var imgCover: UIImageView!
    var service : GameDetailViewModelProtocol?{
        didSet{
            service?.delegate = self
        }
    }
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnReadMoreLess: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnVisitReddit: UIButton!
    @IBOutlet weak var btnVisitWebsite: UIButton!
    
    private let numberOfLinesOfLblDescription = 4
    
    var btnFavorite : UIBarButtonItem?
    var game: GamePresentationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDescription.numberOfLines = numberOfLinesOfLblDescription // initial numbe rof lines
        if( game != nil){
            setUI(with: game!)
            service?.getGame(with: game!.gameId)
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
        //set favorite button
        btnFavorite = UIBarButtonItem()
        btnFavorite?.target = self
        btnFavorite!.action = #selector(onBtnFavorite)
        self.navigationItem.rightBarButtonItem = btnFavorite
    }
    
    var descriptionExpanded : Bool = false{
        didSet{
            if(descriptionExpanded == true){
                btnReadMoreLess.setTitle("Read Less", for: .normal)
                lblDescription.numberOfLines = 0
            }
            else{
                lblDescription.numberOfLines = numberOfLinesOfLblDescription
                btnReadMoreLess.setTitle("Read More", for: .normal)
            }
        }
    }
    
    
    
    @objc private func onBtnFavorite() {
        if(service?.isFavorite(game!) != true ){
            _ = service?.favorite(game!)
        }
        else
        {
            _ = service?.unFavorite(game!)
        }
    }
    
    @IBAction func onBtnReadMoreClick(_ sender: Any) {
        descriptionExpanded = !descriptionExpanded
    }
    
    @IBAction func onBtnVisitRedditClick(_ sender: Any) {
        service?.openUrl(with: game?.redditLink?.url ?? "")
    }
    @IBAction func onBtnVisitWebsiteClick(_ sender: Any) {
        service?.openUrl(with: game?.websiteLink?.url ?? "")
    }
    
}
extension GameDetailViewController:GameDetailContollerProtocol
{
    func displayGame(with game: GamePresentationModel) {
        self.game = game
        setUI(with: game)
    }
    func setUI(with game: GamePresentationModel) -> Void {
        self.title = game.gameName
        lblName.text = game.gameName
        lblDescription.attributedText = NSMutableAttributedString(string: game.gameDescription)
        imgCover.setImage(withUrl: game.backgroundImage, and: "defaultImage")
    }
    func updateBtnFavoriteTitle(_ isFavorite:Bool) -> Void {
        btnFavorite?.title = isFavorite == true ? "Unfavorite" : "Favorite"
    }
    
}


