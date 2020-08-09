//
//  Clips.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Clips: Codable {

  enum CodingKeys: String, CodingKey {
    case full = "full"
    case r640 = "640"
    case r320 = "320"
  }

  var full: String?
  var r640: String?
  var r320: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    full = try container.decodeIfPresent(String.self, forKey: .full)
    r640 = try container.decodeIfPresent(String.self, forKey: .r640)
    r320 = try container.decodeIfPresent(String.self, forKey: .r320)
  }

}
