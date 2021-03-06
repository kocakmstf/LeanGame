//
//  Tags.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Tags: Codable {

  enum CodingKeys: String, CodingKey {
    case slug = "slug"
    case name = "name"
    case gamesCount = "games_count"
    case language = "language"
    case imageBackground = "image_background"
    case id = "id"
  }

  var slug: String?
  var name: String?
  var gamesCount: Int?
  var language: String?
  var imageBackground: String?
  var id: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
    language = try container.decodeIfPresent(String.self, forKey: .language)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
