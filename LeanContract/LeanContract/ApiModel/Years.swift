//
//  Years.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Years: Codable {

  enum CodingKeys: String, CodingKey {
    case nofollow = "nofollow"
    case count = "count"
    case year = "year"
  }

  var nofollow: Bool?
  var count: Int?
  var year: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    nofollow = try container.decodeIfPresent(Bool.self, forKey: .nofollow)
    count = try container.decodeIfPresent(Int.self, forKey: .count)
    year = try container.decodeIfPresent(Int.self, forKey: .year)
  }

}
