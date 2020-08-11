//
//  GameListServiceProtocol.swift
//  LeanContract
//
//  Created by Mustafa KOCAK on 9.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation

/*
 game information protocol.
 */
public protocol GameListServiceProtocol {
    
    /*
     Full game list with page and take parameters. search key can be empty
     */
    func fetchGameList(_ page: Int, take itemCount: Int, search key:String, on complatition:  @escaping((Result<GameListModel>) -> Void)) -> Void
    /*
     Game detail information.
     */
    func fetchGameDetail(with gameId:Int, complatition: @escaping((Result<GameDetailModel>) -> Void)) -> Void
    init(_ environment:Environment)
}
