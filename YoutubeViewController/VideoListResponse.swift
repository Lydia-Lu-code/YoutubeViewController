// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let kind, etag: String
    let items: [Item]
    let pageInfo: PageInfo
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
    let contentDetails: ContentDetails
    let statistics: Statistics
}

// MARK: - ContentDetails
struct ContentDetails: Codable {
    let duration, dimension, definition, caption: String
    let licensedContent: Bool
    let contentRating: ContentRating
    let projection: String
}

// MARK: - ContentRating
struct ContentRating: Codable {
}

// MARK: - Snippet
struct Snippet: Codable {
//    let publishedAt: Date
    let publishedAt: String
    let channelID, title, description: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let tags: [String]
    let categoryID, liveBroadcastContent: String
    let localized: Localized
    let defaultAudioLanguage: String

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, localized, defaultAudioLanguage
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, description: String
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - Statistics
struct Statistics: Codable {
    let viewCount, likeCount, favoriteCount, commentCount: String
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

