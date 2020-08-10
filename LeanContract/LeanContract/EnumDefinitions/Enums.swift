//
//  Enums.swift
//  LeanContract
//
//  Created by Mustafa KOCAK on 9.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
