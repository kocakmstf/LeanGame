//
//  ApiEnvironmentProtocol.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation


/*
 Base api environment protocol. Url calls should be defined here for data integrity
 */
protocol ApiEnvironmentProtocol {
    var baseUrl:String {get set}
    var headers: [String: String]? {get set}
    func GameListUrl(_ page:Int, take itemCount:Int, search key:String)->UrlEndpoind
    func GameDetailUrl(with gameId:Int)->UrlEndpoind
}
extension ApiEnvironmentProtocol{
    func combineUrl(_ url:String) -> String {
        //TODO: try url validation...
        return baseUrl+url
    }
}
