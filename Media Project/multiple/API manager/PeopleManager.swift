//
//  PeopleManager.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/09/01.
//

import Foundation
import Alamofire

class PeopleManager {
    
    static let shared = PeopleManager()
    
    func callRequestPeople (success: @escaping (People) -> Void, failure: @escaping () -> Void) {
        
        let url = "https://api.themoviedb.org/3/trending/person/day?api_key=\(APIKey.TmdbAPI)"
        let header : HTTPHeaders = [
            "Authorization" : "\(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        
        AF.request(url, headers: header).validate(statusCode: 200...500).responseDecodable(of: People.self) { response in
            
            switch response.result {
            case .success(let value):
                success(value)
                print("=== PEOPLE SUCCESS", value)
                
            case .failure(let error):
                failure()
                print("=== PEOPLE ERROR", error)
            }
        }
        
    }
    
    
    
}
