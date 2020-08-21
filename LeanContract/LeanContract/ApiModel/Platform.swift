//
//  Platform.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Platform: Codable {

  enum CodingKeys: String, CodingKey {
    case imageBackground = "image_background"
    case yearStart = "year_start"
    case id = "id"
    case name = "name"
    case slug = "slug"
    case gamesCount = "games_count"
  }

  var imageBackground: String?
  var yearStart: Int?
  var id: Int?
  var name: String?
  var slug: String?
  var gamesCount: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
    yearStart = try container.decodeIfPresent(Int.self, forKey: .yearStart)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
  }

}
