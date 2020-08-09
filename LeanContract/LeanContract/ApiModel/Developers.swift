//
//  Developers.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Developers: Codable {

  enum CodingKeys: String, CodingKey {
    case gamesCount = "games_count"
    case name = "name"
    case slug = "slug"
    case id = "id"
    case imageBackground = "image_background"
  }

  var gamesCount: Int?
  var name: String?
  var slug: String?
  var id: Int?
  var imageBackground: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
  }

}
