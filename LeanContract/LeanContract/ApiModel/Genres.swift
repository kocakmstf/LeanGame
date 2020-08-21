//
//  Genres.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

public struct Genres: Codable {

  enum CodingKeys: String, CodingKey {
    case slug = "slug"
    case name = "name"
    case imageBackground = "image_background"
    case gamesCount = "games_count"
    case id = "id"
  }

 public var slug: String?
 public var name: String?
 public var imageBackground: String?
 public var gamesCount: Int?
 public var id: Int?

 public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground)
    gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
