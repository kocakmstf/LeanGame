//
//  Results.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

struct GameModel: Codable {

  enum CodingKeys: String, CodingKey {
    case added = "added"
    case backgroundImage = "background_image"
    case suggestionsCount = "suggestions_count"
    case tba = "tba"
    case addedByStatus = "added_by_status"
    case parentPlatforms = "parent_platforms"
    case ratings = "ratings"
    case metacritic = "metacritic"
    case platforms = "platforms"
    case name = "name"
    case dominantColor = "dominant_color"
    case ratingsCount = "ratings_count"
    case rating = "rating"
    case shortScreenshots = "short_screenshots"
    case playtime = "playtime"
    case clip = "clip"
    case id = "id"
    case reviewsTextCount = "reviews_text_count"
    case released = "released"
    case tags = "tags"
    case genres = "genres"
    case reviewsCount = "reviews_count"
    case slug = "slug"
    case saturatedColor = "saturated_color"
    case ratingTop = "rating_top"
    case stores = "stores"
  }

  var added: Int?
  var backgroundImage: String?
  var suggestionsCount: Int?
  var tba: Bool?
  var addedByStatus: AddedByStatus?
  var parentPlatforms: [ParentPlatforms]?
  var ratings: [Ratings]?
  var metacritic: Int?
  var platforms: [Platforms]?
  var name: String?
  var dominantColor: String?
  var ratingsCount: Int?
  var rating: Float?
  var shortScreenshots: [ShortScreenshots]?
  var playtime: Int?
  var clip: Clip?
  var id: Int?
  var reviewsTextCount: Int?
  var released: String?
  var tags: [Tags]?
  var genres: [Genres]?
  var reviewsCount: Int?
  var slug: String?
  var saturatedColor: String?
  var ratingTop: Int?
  var stores: [Stores]?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    added = try container.decodeIfPresent(Int.self, forKey: .added)
    backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
    suggestionsCount = try container.decodeIfPresent(Int.self, forKey: .suggestionsCount)
    tba = try container.decodeIfPresent(Bool.self, forKey: .tba)
    addedByStatus = try container.decodeIfPresent(AddedByStatus.self, forKey: .addedByStatus)
    parentPlatforms = try container.decodeIfPresent([ParentPlatforms].self, forKey: .parentPlatforms)
    ratings = try container.decodeIfPresent([Ratings].self, forKey: .ratings)
    metacritic = try container.decodeIfPresent(Int.self, forKey: .metacritic)
    platforms = try container.decodeIfPresent([Platforms].self, forKey: .platforms)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    dominantColor = try container.decodeIfPresent(String.self, forKey: .dominantColor)
    ratingsCount = try container.decodeIfPresent(Int.self, forKey: .ratingsCount)
    rating = try container.decodeIfPresent(Float.self, forKey: .rating)
    shortScreenshots = try container.decodeIfPresent([ShortScreenshots].self, forKey: .shortScreenshots)
    playtime = try container.decodeIfPresent(Int.self, forKey: .playtime)
    clip = try container.decodeIfPresent(Clip.self, forKey: .clip)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    reviewsTextCount = try container.decodeIfPresent(Int.self, forKey: .reviewsTextCount)
    released = try container.decodeIfPresent(String.self, forKey: .released)
    tags = try container.decodeIfPresent([Tags].self, forKey: .tags)
    genres = try container.decodeIfPresent([Genres].self, forKey: .genres)
    reviewsCount = try container.decodeIfPresent(Int.self, forKey: .reviewsCount)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    saturatedColor = try container.decodeIfPresent(String.self, forKey: .saturatedColor)
    ratingTop = try container.decodeIfPresent(Int.self, forKey: .ratingTop)
    stores = try container.decodeIfPresent([Stores].self, forKey: .stores)
  }

}
