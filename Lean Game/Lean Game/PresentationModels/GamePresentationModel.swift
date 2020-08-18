//
//  GameModel.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract

struct Link {
    var name:String
    var url: String
}
struct GamePresentationModel {
    var gameId : Int
    var gameName:String
    var metaCriticScore:String
    var genre : String
    var backgroundImage: String?
    var gameDescription: String
    var links : [Link]?
    
    init(with gameModel:GameModel) {
        metaCriticScore = ""
          genre = ""
          gameDescription = ""
          links = [Link]()
        
        self.gameId = DefaultValueHelper.nilOrDefaultValue(of: gameModel.id, with: -1)
      
        self.gameName = DefaultValueHelper.nilOrDefaultValue(of: gameModel.name, with: "UnKnown")
        self.backgroundImage = gameModel.backgroundImage
        if let score = gameModel.metacritic {
            self.metaCriticScore = String(score)
        }
        if (gameModel.genres != nil && gameModel.genres!.count > 0 ){
            genre = gameModel.genres!.map({$0.name!}).joined(separator: ", ")
        }
        
        
    }
    
    init(with gameModel:GameDetailModel) {
          metaCriticScore = ""
          genre = ""
          gameDescription = ""
          links = [Link]()
        
        self.gameId = DefaultValueHelper.nilOrDefaultValue(of: gameModel.id, with: -1)
        self.backgroundImage = DefaultValueHelper.nilOrDefaultValue(of: gameModel.backgroundImage, with: "")
        self.gameName = DefaultValueHelper.nilOrDefaultValue(of: gameModel.name, with: "UnKnown")
        self.gameDescription = DefaultValueHelper.nilOrDefaultValue(of: gameModel.descriptionRaw, with: "No Description Defined") //todo: default value constant
          if let score = gameModel.metacritic {
              self.metaCriticScore = String(score)
          }
          if (gameModel.genres != nil && gameModel.genres!.count > 0 ){
            genre = gameModel.genres!.map({DefaultValueHelper.nilOrDefaultValue(of: $0.name, with: "")}).joined(separator: ", ")
          }
        if let redditUrl = gameModel.redditUrl {
            links!.append(Link(name: "Reddit", url: redditUrl))
        }
        if let webSiteUrl = gameModel.website {
            links!.append(Link(name: "Web Site", url: webSiteUrl))
        }
          
      }
    
    
}
class DefaultValueHelper {
   static func nilOrDefaultValue(of character:String?, with defaultValue:String) -> String {
        guard character != nil else {
           return defaultValue
        }
        return character!
    }
    static func nilOrDefaultValue(of numberValue:Int?, with defaultValue:Int) -> Int {
          guard numberValue != nil else {
             return defaultValue
          }
          return numberValue!
      }
}




