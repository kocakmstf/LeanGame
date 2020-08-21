//
//  MetacriticPlatforms.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct MetacriticPlatforms: Codable {

  enum CodingKeys: String, CodingKey {
    case platform = "platform"
    case url = "url"
    case metascore = "metascore"
  }

  var platform: Platform?
  var url: String?
  var metascore: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    platform = try container.decodeIfPresent(Platform.self, forKey: .platform)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    metascore = try container.decodeIfPresent(Int.self, forKey: .metascore)
  }

}
