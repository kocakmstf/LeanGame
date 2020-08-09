//
//  Store.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Store: Codable {

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case slug = "slug"
    case gamesCount = "games_count"
    case imageBackground = "image_background"
    case domain = "domain"
    case name = "name"
  }

  var id: Int?
  var slug: String?
  var gamesCount: Int?
  var imageBackground: String?
  var domain: String?
  var name: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
    domain = try container.decodeIfPresent(String.self, forKey: .domain)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}
