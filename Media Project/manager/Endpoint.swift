//
//  Endpoint.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/16.
//

import Foundation

enum Endpoint {
    
    case movieList
    case credit
    case genre
    
    var requestURL: String {
        switch self {
        case .movieList : return URL.makeEndPointString("trending/movie/day?")
        case .credit: return URL.makeEndPointString("movie/")
        case .genre: return URL.makeEndPointString("genre/movie/list?")
        }
    }
    
}
