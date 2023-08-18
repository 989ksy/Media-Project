////
////  TMDBAPIManager.swift
////  Media Project
////
////  Created by Seungyeon Kim on 2023/08/16.
////
//
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class TMDBAPIManager {
//
//    static let shared = TMDBAPIManager()
//
//    //영화 정보
//
//    func callRequestCodable() {
//        
//        let movieUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(APIKey.TmdbAPI)"
//        let header: HTTPHeaders = [
//            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
//            "accept" : "application/json"
//        ]
//
//        AF.request(movieUrl, headers: header).validate(statusCode: 200...500).responseDecodable(of: ) { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//
//                //                for item in json["results"].arrayValue {
//                //
//                //                    let date = item["release_date"].stringValue
//                //                    let image = item["poster_path"].stringValue
//                //                    let rate = item["vote_average"].doubleValue
//                //                    let title = item["title"].stringValue
//                //                    let type = item["media_type"].stringValue
//                //                    let overview = item["overview"].stringValue
//                //                    let backimage = item["backdrop_path"].stringValue
//                //                    let movieID = item["id"].intValue
//                //                    let genreID = item["genre_ids"].intValue
//                //
//                //                    let data = Movie(date: date, image: image, rate: rate, title: title, type: type, overview: overview, backimage: backimage, movieID: movieID, genreID: genreID )
//                //                    self.movieList.append(data)
//
//                completionHandler(json)
//
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//}
