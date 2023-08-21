//
//  TrendManager.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/17.
//

import Foundation
import Alamofire
import SwiftyJSON

class TrendManager {


    static let shared = TrendManager()

    func callRequestMovie(success: @escaping (Trend) -> Void, failure: @escaping () -> Void) {

        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        let movieUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(APIKey.TmdbAPI)"

        //영화 정보

        AF.request(movieUrl, headers: header).validate(statusCode: 200...500).responseDecodable(of: Trend.self) { response in

            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure()
                print("오류: \(error) 트렌드")
                
            }
        }
    }

}


//                let json = JSON(value)
//                print("JSON: \(json)")
//
//                for item in json["results"].arrayValue {
//
//                    let date = item["release_date"].stringValue
//                    let image = item["poster_path"].stringValue
//                    let rate = item["vote_average"].doubleValue
//                    let title = item["title"].stringValue
//                    let type = item["media_type"].stringValue
//                    let overview = item["overview"].stringValue
//                    let backimage = item["backdrop_path"].stringValue
//                    let movieID = item["id"].intValue
//
//                    let genreID = item["genre_ids"].arrayValue[0]
//                    print("****Genre Id", item["genre_ids"].arrayValue[0])
//
//                    let data = Movie(date: date, image: image, rate: rate, title: title, type: type, overview: overview, backimage: backimage, movieID: movieID, genreID: genreID.rawValue as! Int )
//                    self.movieList.append(data)
