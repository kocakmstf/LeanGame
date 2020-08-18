//
//  GameListServiceApi.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
import Alamofire


/*
 Game api service. environment variables injected and request models injected.
 */
public class GameListServiceApi:GameListServiceProtocol
{
    var api: GameApiEnvironmentProtocol!
    var httpRequest: HttpRequestProtocol
    public required init(_ environment: Environment) {
        switch environment {
        case .development:
            api = DevelopmentEnvironment()
        case .production:
            api = ProductionEnvironment()
        }
        httpRequest = AFHttpRequest()
    }
    
    public func fetchGameList(_ page: Int, take itemCount: Int, search key:String, on complatition: @escaping ((Result<GameListModel>) -> Void)) {
        //TODO: check internet connection, use cached data if requied.
        httpRequest.get(GameListModel.self, with: api.GameListUrl(page, take: itemCount, search: key), completion: complatition)
    }
    
    public func fetchGameDetail(with gameId: Int, complatition: @escaping((Result<GameDetailModel>) -> Void)) {
          //TODO: check internet connection, use cached data if requied.
        httpRequest.get(GameDetailModel.self, with: api.GameDetailUrl(with: gameId), completion: complatition)
        
    }
    
    
    
}




