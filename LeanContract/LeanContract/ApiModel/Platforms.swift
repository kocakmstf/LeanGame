//
//  Platforms.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Platforms: Codable {

  enum CodingKeys: String, CodingKey {
    case releasedAt = "released_at"
    case requirementsRu = "requirements_ru"
    case platform = "platform"
    case requirementsEn = "requirements_en"
  }

  var releasedAt: String?
  var requirementsRu: Requirements?
  var platform: Platform?
  var requirementsEn: Requirements?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    releasedAt = try container.decodeIfPresent(String.self, forKey: .releasedAt)
    requirementsRu = try container.decodeIfPresent(Requirements.self, forKey: .requirementsRu)
    platform = try container.decodeIfPresent(Platform.self, forKey: .platform)
    requirementsEn = try container.decodeIfPresent(Requirements.self, forKey: .requirementsEn)
  }

}
