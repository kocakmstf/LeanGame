
//
//  ProductionEnvironment.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import Alamofire


/*
 Production environment url list.
 */
//TODO: urls hard coded. get from plist etc.
struct ProductionEnvironment:ApiEnvironmentProtocol{
    
    
    var headers: [String : String]?
    var baseUrl: String
    init() {
        self.baseUrl="https://api.rawg.io/api/"
        headers=["Content-Type":"application/json"]
    }
    
    /*
     Game list url component.
     */
    func GameListUrl(_ page: Int, take itemCount: Int, search key:String) -> UrlEndpoind{
        var queryParams=["page" : page, "page_size" : itemCount] as [String : Any]
        if(key.count>0)
        {
            queryParams["search"]=key
        }
        let url = combineUrl("games")
        let urlEnpoint = UrlEndpoind(url:url, method: .get, parameters: queryParams, additionalHeaders: headers)
        return urlEnpoint
    }
    func GameDetailUrl(with gameId:Int) -> UrlEndpoind {
        let url = combineUrl("games/\(gameId)")
        let urlEnpoint = UrlEndpoind(url:url, method: .get, parameters: nil, additionalHeaders: headers)
        return urlEnpoint
    }
}

/*
 Development environment url list.
 */
//TODO: urls hard coded. get from plist etc.
struct DevelopmentEnvironment:ApiEnvironmentProtocol{
    var headers: [String : String]?
    var baseUrl: String
    init() {
        self.baseUrl="https://api.rawg.io/api/"
    }
    func GameListUrl(_ page: Int, take itemCount: Int, search key:String) -> UrlEndpoind{
        var queryParams=["page" : page, "page_size" : itemCount] as [String : Any]
        if(key.count>0)
        {
            queryParams["search"]=key
        }
        let url = combineUrl("games")
        let urlEnpoint = UrlEndpoind(url:url, method: .get, parameters: queryParams, additionalHeaders: nil)
        return urlEnpoint
    }
    func GameDetailUrl(with gameId:Int) -> UrlEndpoind {
        let url = combineUrl("games/\(gameId)")
        let urlEnpoint = UrlEndpoind(url:url, method: .get, parameters: nil, additionalHeaders: nil)
        return urlEnpoint
    }
}




