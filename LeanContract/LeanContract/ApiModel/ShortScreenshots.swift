//
//  ShortScreenshots.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct ShortScreenshots: Codable {

  enum CodingKeys: String, CodingKey {
    case image = "image"
    case id = "id"
  }

  var image: String?
  var id: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    image = try container.decodeIfPresent(String.self, forKey: .image)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
