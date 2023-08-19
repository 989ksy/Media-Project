//
//  SimilarManager.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/19.
//

import Foundation
import Alamofire

class SimilarManager {
    
    static let shared = SimilarManager()
    
    
    func callRequestSimilarity(id: Int, page: Int, competionHandler: @escaping (Similar) -> Void, failure: @escaping () -> Void ) {
        
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        
        let url = "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=\(APIKey.TmdbAPI)&language=ko-KO&page=\(page)"
        
        AF.request(url, headers: header).validate(statusCode: 200...500).responseDecodable(of: Similar.self) { response in
            switch response.result {
            case .success(let value):
                
                competionHandler(value)
                
            case .failure(let error):
                
                failure()
                print(error, "시매")
            }
        }
    }
    
    
}
