//
//  HttpRequestTest.swift
//  LeanApiTests
//
//  Created by Mustafa KOCAK on 10.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import XCTest
import LeanContract
import LeanApi
class HttpRequestTest: XCTestCase {
    func testGameList() throws {
        print("test run")
        var api :GameListServiceProtocol
        api = GameListServiceApi(.development)
        api.fetchGameList(1, take: 10, search: "gta5") { (result) in
            switch result{
            case  .success(let value):
                print("success")
                XCTAssertTrue(value.results!.count > 0)
                
            case .failure(let error):
                XCTAssertTrue(1==0)
            }
        }
    }
    func testGameDetail() throws {
        var api :GameListServiceProtocol
        api = GameListServiceApi(.production)
        api.fetchGameDetail(with: 3498) { (result) in
            switch result{
            case  .success(let value):
                print("success")
                XCTAssertTrue(value.slug == "grand-theft-auto-v" )
                
            case .failure(let error):
                XCTAssertTrue(1==0)
            }
        }
    }
    
    
    
}
