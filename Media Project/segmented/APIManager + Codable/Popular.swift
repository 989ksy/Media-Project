//
//  Popular.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/19.
//

import Foundation

// MARK: - Popular
struct Popular: Codable {
    let page: Int
    let results: [PopularResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PopularResult: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: originalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let releaseDate, title: String
    let posterPath: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum originalLanguage: String, Codable {
    case en = "en"
    case fr = "fr"
    case ja = "ja"
    case pl = "pl"
}
