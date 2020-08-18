//
//  GameDetailViewContoller.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 18.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit

protocol GameDetailContollerProtocol:BaseViewController {
    func displayGame(with game:GamePresentationModel) -> Void
    func showLoader() -> Void
    func hideLoader() -> Void
    func showErrorMessage(_ message:String) -> Void
}
final class GameDetailViewController:BaseViewController
{
    @IBOutlet weak var imgCover: UIImageView!
    var service : GameDetailViewModelProtocol?
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnReadMoreLess: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnVisitReddit: UIButton!
    @IBOutlet weak var btnVisitWebsite: UIButton!
    
    
    
    var descriptionExpanded : Bool = false{
        didSet{
            if(descriptionExpanded == true){
                btnReadMoreLess.setTitle("Read Less", for: .normal)
                lblDescription.numberOfLines = 0
            }
            else{
                lblDescription.numberOfLines = 4
                btnReadMoreLess.setTitle("Read More", for: .normal)
            }
        }
    }
    
    var game: GamePresentationModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        service = GameDetailViewModel()
        service?.delegate=self
        lblDescription.numberOfLines = 4
        if( game != nil){
            setUI(with: game!)
            service?.getGame(with: game!.gameId)
            self.title = game?.gameName
        }
        else{
              self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func onBtnReadMoreClick(_ sender: Any) {
        descriptionExpanded = !descriptionExpanded
    }
    
    @IBAction func onBtnVisitRedditClick(_ sender: Any) {
        OpenSafari(with: game?.redditLink?.url ?? "")
    }
    @IBAction func onBtnVisitWebsiteClick(_ sender: Any) {
        OpenSafari(with: game?.websiteLink?.url ?? "")
    }
    
}
extension GameDetailViewController:GameDetailContollerProtocol
{
    func displayGame(with game: GamePresentationModel) {
        self.game = game
        setUI(with: game)
    }
    func setUI(with game: GamePresentationModel) -> Void {
        lblName.text = game.gameName
        lblDescription.attributedText = NSMutableAttributedString(string: game.gameDescription)
        imgCover.setImage(withUrl: game.backgroundImage, and: "defaultImage")
    }
    func OpenSafari(with urlString:String) -> Void {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}


