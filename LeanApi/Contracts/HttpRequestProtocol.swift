//
//  HttpRequestProtocol.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 11.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
/*
 middleware for httpRequests. can be injected any networking libraries
 */
public protocol HttpRequestProtocol {
    /*
     creates http request with decodable model type and returns data.
     */
     func get<T>(_ type:T.Type,with urlEndpoind: UrlEndpoind, completion: @escaping (Result<T>) -> Void)  where T:(Decodable)
}
