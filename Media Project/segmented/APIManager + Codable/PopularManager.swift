//
//  PopularManager.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/19.
//

import Foundation
import Alamofire

class PopularManager {
    
    static let shared = PopularManager()
    
    func callRequestUpcoming(page: Int, competionHandler: @escaping (Popular) -> Void, failure: @escaping () -> Void ) {
        
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey.TmdbAPI)&language=en-US&page=\(page)"
        
        
        AF.request(url, headers: header).validate(statusCode: 200...500).responseDecodable(of: Popular.self) { response in
            switch response.result {
            case .success(let value):
                competionHandler(value)
                
            case .failure(let error):
                failure()
                print(error, "팝매")
            }
        }
    
        
    }
    
    
    
}
