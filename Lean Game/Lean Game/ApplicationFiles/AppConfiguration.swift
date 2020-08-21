//
//  AppConfiguration.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 13.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import LeanContract
protocol AppConfigurationProtocol {
    var environment:Environment {get}
    var gameListSearchParameterCount:Int {get set}
    var gameListVerticalHorizantalCount:Int {get set}
    var gameListVerticalColumnCount:Int {get set}
    
   
}

class ProductionConfiguration:AppConfigurationProtocol {
     
    var gameListVerticalHorizantalCount: Int
    
    var gameListVerticalColumnCount: Int
    
    var gameListSearchParameterCount: Int
    
    var environment: Environment
    init() {
        environment = .production
        gameListSearchParameterCount = 3
        gameListVerticalColumnCount = 2
        gameListVerticalHorizantalCount = 1
      
    }
}


