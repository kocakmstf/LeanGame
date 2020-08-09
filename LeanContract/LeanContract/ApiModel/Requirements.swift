//
//  RequirementsEn.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Requirements: Codable {

  enum CodingKeys: String, CodingKey {
    case recommended = "recommended"
    case minimum = "minimum"
  }

  var recommended: String?
  var minimum: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    recommended = try container.decodeIfPresent(String.self, forKey: .recommended)
    minimum = try container.decodeIfPresent(String.self, forKey: .minimum)
  }

}
