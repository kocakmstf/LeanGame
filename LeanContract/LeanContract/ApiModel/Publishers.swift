//
//  Publishers.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Publishers: Codable {

  enum CodingKeys: String, CodingKey {
    case imageBackground = "image_background"
    case slug = "slug"
    case name = "name"
    case id = "id"
    case gamesCount = "games_count"
  }

  var imageBackground: String?
  var slug: String?
  var name: String?
  var id: Int?
  var gamesCount: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
  }

}
