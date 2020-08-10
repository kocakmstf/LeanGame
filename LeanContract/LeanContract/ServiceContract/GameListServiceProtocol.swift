//
//  GameListServiceProtocol.swift
//  LeanContract
//
//  Created by Mustafa KOCAK on 9.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation

public protocol GameListServiceProtocol {
    func fetchGameList(_ page: Int, take itemCount: Int, search key:String, on complatition:  @escaping((Result<GameListModel>) -> Void)) -> Void
    func fetchGameDetail(with gameId:Int, complatition: @escaping((Result<GameDetailModel>) -> Void)) -> Void
    init(_ environment:Environment)
}
