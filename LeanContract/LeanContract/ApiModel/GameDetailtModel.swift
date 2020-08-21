//
//  GameListModel.swift
//
//  Created by Mustafa KOCAK on 9.08.2020
//  Copyright (c) kocakmstf. All rights reserved.
//

import Foundation

public struct GameDetailModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case parentPlatforms = "parent_platforms"
        case metacriticPlatforms = "metacritic_platforms"
        case moviesCount = "movies_count"
        case redditName = "reddit_name"
        case slug = "slug"
        case backgroundImage = "background_image"
        case additionsCount = "additions_count"
        case alternativeNames = "alternative_names"
        case stores = "stores"
        case parentsCount = "parents_count"
        case descriptionRaw = "description_raw"
        case dominantColor = "dominant_color"
        case ratings = "ratings"
        case redditDescription = "reddit_description"
        case ratingTop = "rating_top"
        case nameOriginal = "name_original"
        case gameSeriesCount = "game_series_count"
        case redditUrl = "reddit_url"
        case id = "id"
        case screenshotsCount = "screenshots_count"
        case publishers = "publishers"
        case released = "released"
        case tags = "tags"
        case achievementsCount = "achievements_count"
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case descriptionValue = "description"
        case playtime = "playtime"
        case redditLogo = "reddit_logo"
        case esrbRating = "esrb_rating"
        case developers = "developers"
        case clip = "clip"
        case genres = "genres"
        case creatorsCount = "creators_count"
        case metacriticUrl = "metacritic_url"
        case tba = "tba"
        case website = "website"
        case suggestionsCount = "suggestions_count"
        case reviewsCount = "reviews_count"
        case metacritic = "metacritic"
        case saturatedColor = "saturated_color"
        case backgroundImageAdditional = "background_image_additional"
        case addedByStatus = "added_by_status"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case added = "added"
        case platforms = "platforms"
        case parentAchievementsCount = "parent_achievements_count"
        case name = "name"
        case redditCount = "reddit_count"
        case updated = "updated"
        case rating = "rating"
    }
    
    var parentPlatforms: [ParentPlatforms]?
    var metacriticPlatforms: [MetacriticPlatforms]?
    var moviesCount: Int?
    var redditName: String?
    public var slug: String?
    public var backgroundImage: String?
    var additionsCount: Int?
    var alternativeNames: [String]?
    var stores: [Stores]?
    var parentsCount: Int?
    public  var descriptionRaw: String?
    var dominantColor: String?
    var ratings: [Ratings]?
    public var redditDescription: String?
    var ratingTop: Int?
    var nameOriginal: String?
    var gameSeriesCount: Int?
    public  var redditUrl: String?
    public  var id: Int?
    var screenshotsCount: Int?
    var publishers: [Publishers]?
    var released: String?
    var tags: [Tags]?
    var achievementsCount: Int?
    var ratingsCount: Int?
    var reviewsTextCount: Int?
    var descriptionValue: String?
    var playtime: Int?
    var redditLogo: String?
    var esrbRating: EsrbRating?
    var developers: [Developers]?
    var clip: Clip?
    public  var genres: [Genres]?
    var creatorsCount: Int?
    var metacriticUrl: String?
    var tba: Bool?
    public var website: String?
    var suggestionsCount: Int?
    var reviewsCount: Int?
    public  var metacritic: Int?
    var saturatedColor: String?
    var backgroundImageAdditional: String?
    var addedByStatus: AddedByStatus?
    var twitchCount: Int?
    var youtubeCount: Int?
    var added: Int?
    var platforms: [Platforms]?
    var parentAchievementsCount: Int?
    public var name: String?
    var redditCount: Int?
    var updated: String?
    var rating: Float?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parentPlatforms = try container.decodeIfPresent([ParentPlatforms].self, forKey: .parentPlatforms)
        metacriticPlatforms = try container.decodeIfPresent([MetacriticPlatforms].self, forKey: .metacriticPlatforms)
        moviesCount = try container.decodeIfPresent(Int.self, forKey: .moviesCount)
        redditName = try container.decodeIfPresent(String.self, forKey: .redditName)
        slug = try container.decodeIfPresent(String.self, forKey: .slug)
        backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        additionsCount = try container.decodeIfPresent(Int.self, forKey: .additionsCount)
        alternativeNames = try container.decodeIfPresent([String].self, forKey: .alternativeNames)
        stores = try container.decodeIfPresent([Stores].self, forKey: .stores)
        parentsCount = try container.decodeIfPresent(Int.self, forKey: .parentsCount)
        descriptionRaw = try container.decodeIfPresent(String.self, forKey: .descriptionRaw)
        dominantColor = try container.decodeIfPresent(String.self, forKey: .dominantColor)
        ratings = try container.decodeIfPresent([Ratings].self, forKey: .ratings)
        redditDescription = try container.decodeIfPresent(String.self, forKey: .redditDescription)
        ratingTop = try container.decodeIfPresent(Int.self, forKey: .ratingTop)
        nameOriginal = try container.decodeIfPresent(String.self, forKey: .nameOriginal)
        gameSeriesCount = try container.decodeIfPresent(Int.self, forKey: .gameSeriesCount)
        redditUrl = try container.decodeIfPresent(String.self, forKey: .redditUrl)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        screenshotsCount = try container.decodeIfPresent(Int.self, forKey: .screenshotsCount)
        publishers = try container.decodeIfPresent([Publishers].self, forKey: .publishers)
        released = try container.decodeIfPresent(String.self, forKey: .released)
        tags = try container.decodeIfPresent([Tags].self, forKey: .tags)
        achievementsCount = try container.decodeIfPresent(Int.self, forKey: .achievementsCount)
        ratingsCount = try container.decodeIfPresent(Int.self, forKey: .ratingsCount)
        reviewsTextCount = try container.decodeIfPresent(Int.self, forKey: .reviewsTextCount)
        descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
        playtime = try container.decodeIfPresent(Int.self, forKey: .playtime)
        redditLogo = try container.decodeIfPresent(String.self, forKey: .redditLogo)
        esrbRating = try container.decodeIfPresent(EsrbRating.self, forKey: .esrbRating)
        developers = try container.decodeIfPresent([Developers].self, forKey: .developers)
        clip = try container.decodeIfPresent(Clip.self, forKey: .clip)
        genres = try container.decodeIfPresent([Genres].self, forKey: .genres)
        creatorsCount = try container.decodeIfPresent(Int.self, forKey: .creatorsCount)
        metacriticUrl = try container.decodeIfPresent(String.self, forKey: .metacriticUrl)
        tba = try container.decodeIfPresent(Bool.self, forKey: .tba)
        website = try container.decodeIfPresent(String.self, forKey: .website)
        suggestionsCount = try container.decodeIfPresent(Int.self, forKey: .suggestionsCount)
        reviewsCount = try container.decodeIfPresent(Int.self, forKey: .reviewsCount)
        metacritic = try container.decodeIfPresent(Int.self, forKey: .metacritic)
        saturatedColor = try container.decodeIfPresent(String.self, forKey: .saturatedColor)
        backgroundImageAdditional = try container.decodeIfPresent(String.self, forKey: .backgroundImageAdditional)
        addedByStatus = try container.decodeIfPresent(AddedByStatus.self, forKey: .addedByStatus)
        twitchCount = try container.decodeIfPresent(Int.self, forKey: .twitchCount)
        youtubeCount = try container.decodeIfPresent(Int.self, forKey: .youtubeCount)
        added = try container.decodeIfPresent(Int.self, forKey: .added)
        platforms = try container.decodeIfPresent([Platforms].self, forKey: .platforms)
        parentAchievementsCount = try container.decodeIfPresent(Int.self, forKey: .parentAchievementsCount)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        redditCount = try container.decodeIfPresent(Int.self, forKey: .redditCount)
        updated = try container.decodeIfPresent(String.self, forKey: .updated)
        rating = try container.decodeIfPresent(Float.self, forKey: .rating)
    }
    
}
