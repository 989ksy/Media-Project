//
//  People.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/09/01.
//

import Foundation

// MARK: - People
struct People: Codable {
    let page: Int
    let results: [PeopleResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PeopleResult: Codable {
    let adult: Bool
    let id: Int
    let name, originalName: String?
    let mediaType: ResultMediaType
    let popularity: Double
    let gender: Int
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult, id, name
        case originalName = "original_name"
        case mediaType = "media_type"
        case popularity, gender
        case profilePath = "profile_path"
    }
}

enum KnownForMediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case de = "de"
    case en = "en"
    case fr = "fr"
    case ko = "ko"
}

enum ResultMediaType: String, Codable {
    case person = "person"
}
