//
//  AddedByStatus.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct AddedByStatus: Codable {

  enum CodingKeys: String, CodingKey {
    case owned = "owned"
    case beaten = "beaten"
    case toplay = "toplay"
    case playing = "playing"
    case yet = "yet"
    case dropped = "dropped"
  }

  var owned: Int?
  var beaten: Int?
  var toplay: Int?
  var playing: Int?
  var yet: Int?
  var dropped: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    owned = try container.decodeIfPresent(Int.self, forKey: .owned)
    beaten = try container.decodeIfPresent(Int.self, forKey: .beaten)
    toplay = try container.decodeIfPresent(Int.self, forKey: .toplay)
    playing = try container.decodeIfPresent(Int.self, forKey: .playing)
    yet = try container.decodeIfPresent(Int.self, forKey: .yet)
    dropped = try container.decodeIfPresent(Int.self, forKey: .dropped)
  }

}
