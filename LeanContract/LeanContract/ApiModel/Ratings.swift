//
//  Ratings.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Ratings: Codable {

  enum CodingKeys: String, CodingKey {
    case count = "count"
    case percent = "percent"
    case title = "title"
    case id = "id"
  }

  var count: Int?
  var percent: Float?
  var title: String?
  var id: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    count = try container.decodeIfPresent(Int.self, forKey: .count)
    percent = try container.decodeIfPresent(Float.self, forKey: .percent)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
