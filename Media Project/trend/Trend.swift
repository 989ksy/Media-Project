//
//  Trend.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/18.
//

import Foundation

// MARK: - Trend
struct Trend: Codable {
    let totalPages, totalResults: Int
    let results: [Result]
    let page: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results, page
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let voteCount: Int
    let voteAverage: Double
    let backdropPath: String
    let mediaType: MediaType
    let video: Bool
    let genreIDS: [Int]
    let originalTitle, posterPath: String
    let popularity: Double
    let adult: Bool
    let id: Int
    let originalLanguage: String //OriginalLanguage
    let releaseDate, overview: String

    enum CodingKeys: String, CodingKey {
        case title
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case mediaType = "media_type"
        case video
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case popularity, adult, id
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
        case overview
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

