//
//  Stores.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct Stores: Codable {

  enum CodingKeys: String, CodingKey {
    case urlEn = "url_en"
    case urlRu = "url_ru"
    case store = "store"
    case id = "id"
  }

  var urlEn: String?
  var urlRu: String?
  var store: Store?
  var id: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    urlEn = try container.decodeIfPresent(String.self, forKey: .urlEn)
    urlRu = try container.decodeIfPresent(String.self, forKey: .urlRu)
    store = try container.decodeIfPresent(Store.self, forKey: .store)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
