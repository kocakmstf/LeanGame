//
//  Genres.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Genres: Codable {

  enum CodingKeys: String, CodingKey {
    case slug = "slug"
    case name = "name"
    case imageBackground = "image_background"
    case gamesCount = "games_count"
    case id = "id"
  }

  var slug: String?
  var name: String?
  var imageBackground: String?
  var gamesCount: Int?
  var id: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
