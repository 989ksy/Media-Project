//
//  URL + Extension.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/16.
//

import Foundation

extension URL {
    
    static let baseURL = "https://api.themoviedb.org/3/"
    
    static func makeEndPointString (_ endpoint: String) -> String {
        return baseURL + endpoint
    }
    
}
