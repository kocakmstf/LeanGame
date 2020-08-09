//
//  GameListModel.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct GameListModel: Codable {

  enum CodingKeys: String, CodingKey {
    case seoDescription = "seo_description"
    case noindex = "noindex"
    case seoTitle = "seo_title"
    case results = "results"
    case descriptionValue = "description"
    case nofollowCollections = "nofollow_collections"
    case next = "next"
    case nofollow = "nofollow"
    case seoH1 = "seo_h1"
    case filters = "filters"
    case seoKeywords = "seo_keywords"
    case count = "count"
  }

  var seoDescription: String?
  var noindex: Bool?
  var seoTitle: String?
  var results: [GameModel]?
  var descriptionValue: String?
  var nofollowCollections: [String]?
  var next: String?
  var nofollow: Bool?
  var seoH1: String?
  var filters: Filters?
  var seoKeywords: String?
  var count: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    seoDescription = try container.decodeIfPresent(String.self, forKey: .seoDescription)
    noindex = try container.decodeIfPresent(Bool.self, forKey: .noindex)
    seoTitle = try container.decodeIfPresent(String.self, forKey: .seoTitle)
    results = try container.decodeIfPresent([GameModel].self, forKey: .results)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    nofollowCollections = try container.decodeIfPresent([String].self, forKey: .nofollowCollections)
    next = try container.decodeIfPresent(String.self, forKey: .next)
    nofollow = try container.decodeIfPresent(Bool.self, forKey: .nofollow)
    seoH1 = try container.decodeIfPresent(String.self, forKey: .seoH1)
    filters = try container.decodeIfPresent(Filters.self, forKey: .filters)
    seoKeywords = try container.decodeIfPresent(String.self, forKey: .seoKeywords)
    count = try container.decodeIfPresent(Int.self, forKey: .count)
  }

}
