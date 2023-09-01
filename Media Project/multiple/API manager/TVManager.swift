//
//  TVManager.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/09/01.
//

import Foundation
import Alamofire

class TVManger {
    
    static let shared = TVManger()
    
    func callRequestTV (success: @escaping (TV) -> (), failure: @escaping () -> ()) {
        
        let url = "https://api.themoviedb.org/3/trending/tv/day?api_key=\(APIKey.TmdbAPI)"
        let header : HTTPHeaders = [
            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        
        AF.request(url, headers: header).validate(statusCode: 200...500).responseDecodable(of: TV.self) { response in
            switch response.result {
            case .success(let value):
                
                success(value)
                print("===TV SUCCESS", value)
                
            case .failure(let error):
                print("===TV ERROR", error)
            }
        }
        
    }
    
}
