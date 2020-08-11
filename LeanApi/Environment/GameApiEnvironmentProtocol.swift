//
//  ApiEnvironmentProtocol.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
protocol BaseApiEnvironmentProtocol {
     var baseUrl:String {get set}
     var headers: [String: String]? {get set}
}

/*
 Game api environment protocol. Url calls should be defined here for data integrity
 Game list request should conform this environment.
 This protocol required for api calls and environment selection.
 */
protocol GameApiEnvironmentProtocol:BaseApiEnvironmentProtocol{
   
    func GameListUrl(_ page:Int, take itemCount:Int, search key:String)->UrlEndpoind
    func GameDetailUrl(with gameId:Int)->UrlEndpoind
}
extension GameApiEnvironmentProtocol{
    func combineUrl(_ url:String) -> String {
        //TODO: try url validation...
        return baseUrl+url
    }
}
