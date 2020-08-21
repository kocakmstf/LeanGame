//
//  ParentPlatforms.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct ParentPlatforms: Codable {

  enum CodingKeys: String, CodingKey {
    case platform = "platform"
  }

  var platform: Platform?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    platform = try container.decodeIfPresent(Platform.self, forKey: .platform)
  }

}
