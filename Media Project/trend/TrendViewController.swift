//
//  ViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Movie {
    var date : String
//    var trend : String
    var image : String
    var rate : Int
    var title : String
//    var subTitle : String
}

class TrendViewController: UIViewController {
    
    var movieList : [Movie] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .brown
        callRequest()
        
    }
    
    /*{
     "page": 1,
     "results": [
         {
             "adult": false,
             "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
             "id": 569094,
             "title": "Spider-Man: Across the Spider-Verse",
             "original_language": "en",
             "original_title": "Spider-Man: Across the Spider-Verse",
             "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
             "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
             "media_type": "movie",
             "genre_ids": [
                 16,
                 28,
                 12,
                 878
             ],
             "popularity": 4485.474,
             "release_date": "2023-05-31",
             "video": false,
             "vote_average": 8.5,
             "vote_count": 3087
         }*/
    
    func callRequest() {
        
        let url = "https://api.themoviedb.org/3/trending/movie/week?language=en-US"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["results"].arrayValue {
                    
                    let title = item["title"].stringValue
                    let poster = item["poster_path"].stringValue
                    let date = item["release_date"].stringValue
                    let rate = item["vote_average"].intValue
//                    let genre = item["genre_ids"].stringValue

                let data = Movie(date: date, image: poster, rate: rate, title: title)
                    
                }
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }


}


extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier) as! TrendTableViewCell
        
        let row = indexPath.row
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
