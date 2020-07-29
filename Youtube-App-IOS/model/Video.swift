// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Video
struct Video: Codable {
    let kind, etag, nextPageToken: String?
    let items: [Item]?
    let pageInfo: PageInfo?
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String?
    let snippet: Snippet?
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: String?
    let channelId, title, description: String?
    let thumbnails: Thumbnails?
    let channelTitle, playlistId: String?
    let position: Int?
    let resourceId: ResourceId?

    enum CodingKeys: String, CodingKey {
        case publishedAt, channelId, title
        case description
        case thumbnails, channelTitle, playlistId, position, resourceId
    }
}

// MARK: - ResourceId
struct ResourceId: Codable {
    let kind, videoId: String?
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let  medium, high, standard: Default?
    let maxres: Default?

    enum CodingKeys: String, CodingKey {
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String?
    let width, height: Int?
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int?
}
