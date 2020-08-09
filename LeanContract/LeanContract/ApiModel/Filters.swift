//
//  Filters.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Filters: Codable {

  enum CodingKeys: String, CodingKey {
    case years = "years"
  }

  var years: [Years]?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    years = try container.decodeIfPresent([Years].self, forKey: .years)
  }

}
