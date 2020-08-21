//
//  Results.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

public struct GameModel: Codable {
    
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
    
    public var added: Int?
    public var backgroundImage: String?
    public var suggestionsCount: Int?
    public var tba: Bool?
    var addedByStatus: AddedByStatus?
    var parentPlatforms: [ParentPlatforms]?
    var ratings: [Ratings]?
    public var metacritic: Int?
    var platforms: [Platforms]?
    public var name: String?
    public var dominantColor: String?
    public var ratingsCount: Int?
    public var rating: Float?
    var shortScreenshots: [ShortScreenshots]?
    public var playtime: Int?
    var clip: Clip?
    public var id: Int?
    public var reviewsTextCount: Int?
    public var released: String?
    var tags: [Tags]?
    public var genres: [Genres]?
    public var reviewsCount: Int?
    public var slug: String?
    public var saturatedColor: String?
    public var ratingTop: Int?
    var stores: [Stores]?
    
    public init(from decoder: Decoder) throws {
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
