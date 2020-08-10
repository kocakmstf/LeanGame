//
//  UrlEndpoind.swift
//  LeanApi
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import Alamofire

public struct UrlEndpoind{
    
    var url:String
    
    /// HTTP method this endpoint uses
    var method: HTTPMethod
    
    /// Parameters will be parsed based on the HTTP method
    /// For `GET` it will be URL encoding and for `POST` it will be HTTP body JSON encoding
    var parameters: [String: Any]?
    
    /// Any additional header values that should be added along with default header
    /// values defined in `API`
    /// Users can override default header values of API using the same keys
    var additionalHeaders: [String: String]?
    
}
