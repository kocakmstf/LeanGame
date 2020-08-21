//
//  EsrbRating.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct EsrbRating: Codable {

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case id = "id"
    case slug = "slug"
  }

  var name: String?
  var id: Int?
  var slug: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
  }

}
