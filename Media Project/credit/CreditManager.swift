//
//  CastManager.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/18.
//

import Foundation
import Alamofire

class CreditManager {
    
    static let shared = CreditManager()
    
    
    func callRequest(id : Int, success: @escaping (Cast) -> Void, failure: @escaping () -> Void) {
        
        let url = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=\(APIKey.TmdbAPI)"
        
        AF.request(url).validate(statusCode: 200...500).responseDecodable(of: Cast.self) { response in
            switch response.result {
            case .success(let value):
                success(value)
                
            case .failure(let error):
                failure()
                print(error)
            }
        }
        

        
    }
    
}
