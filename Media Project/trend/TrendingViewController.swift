//
//  TrendingViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


struct Movie {
    var date : String
    var image : String
    var rate : Double
    var title : String
    var type : String
    var overview : String
    var backimage : String
    var movieID : Int
    var genreID : Int
    
}

struct Genre {
    var id : Int
    var name : String
}


class TrendingViewController: UIViewController {
    
    var movieList : [Movie] = []
    var cast : Cast?
    
    var genreDictionary : [Int : String] = [
        28 : "Action", 12 : "Abenteuer", 16 : "Animation", 35 : "Komödie", 80 : "Krimi", 99 : "Dokumentarfilm", 18 : "Drama", 10751 : "Familie", 14 : "Fantasy", 36 : "Historie",27 : "Horror", 10402 : "Musik", 9648 : "Mystery", 10749 : "Liebesfilm", 878 : "Science Fiction", 10770 : "TV-Film", 53 : "Thriller", 10752 : "Kriegsfilm", 37 : "Western"
    ]
    
    @IBOutlet var trendingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        callRequest ()
        
        trendingTableView.dataSource = self
        trendingTableView.delegate = self

        let nib = UINib(nibName: "TrendingTableViewCell", bundle: nil)
        trendingTableView.register(nib, forCellReuseIdentifier: "TrendingTableViewCell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(bulletButtonClicked))
    
    }
    
    @objc func searchButtonClicked (_ sender: UIButton) {
    
        print("일단 존재")
        
    }
    
    @objc func bulletButtonClicked (_ Sender: UIButton) {
        
        print("임시 존재")
        
    }
    
    func callRequest () {
        
        let movieUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(APIKey.TmdbAPI)"
        let genreUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey.TmdbAPI)"
        
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        
        //영화 정보
        
        AF.request(movieUrl, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["results"].arrayValue {
                    
                    let date = item["release_date"].stringValue
                    let image = item["poster_path"].stringValue
                    let rate = item["vote_average"].doubleValue
                    let title = item["title"].stringValue
                    let type = item["media_type"].stringValue
                    let overview = item["overview"].stringValue
                    let backimage = item["backdrop_path"].stringValue
                    let movieID = item["id"].intValue
                    let genreID = item["genre_ids"].intValue
                    
                    let data = Movie(date: date, image: image, rate: rate, title: title, type: type, overview: overview, backimage: backimage, movieID: movieID, genreID: genreID )
                    self.movieList.append(data)
                    
                    
                    //장르 정보
                    
//                    AF.request(genreUrl, method: .get).validate().responseJSON { response in
//                        switch response.result {
//                        case .success(let value):
//                            let json = JSON(value)
//                            print("JSON: \(json)")
//
//                            for genre in json["genres"].arrayValue {
//                                let genreID = genre["id"].intValue
//                                let genreName = genre["name"].stringValue
//
//                                let genreData = Genre(id: genreID, name: genreName)
//
//                            }
//
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
                    
                }
                
                print("나오나?")
                
                self.trendingTableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    

}


extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell") as! TrendingTableViewCell
        
        let movie = movieList[indexPath.row]
        
        cell.titleLabel.text = movieList[indexPath.row].title
        cell.dateLabel.text = movieList[indexPath.row].date
        cell.rateNumberLabel.text = "\(movieList[indexPath.row].rate)"
        cell.trendingLabel.text = movieList[indexPath.row].type
        cell.castingLabel.text = " "
//
//        if let genreName = genreDictionary[movie.genreID] {
//            cell.trendingLabel.text = genreName
//        } else {
//            cell.trendingLabel.text = ""
//        }
            
    
        let headUrl = "https://image.tmdb.org/t/p/w500/"
        if let url = URL(string: headUrl + movieList[indexPath.row].image) {
            cell.posterImage.kf.setImage(with: url)
        }
        

        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let creditVC = self.storyboard?.instantiateViewController(withIdentifier: "CreditViewController") as? CreditViewController else { return }
        self.navigationController?.pushViewController(creditVC, animated: true)
        
        let selectMovie = movieList[indexPath.row]
        
        creditVC.selectedMovie = movieList[indexPath.row]
        
        creditVC.movieName = movieList[indexPath.row].title
        creditVC.overView = movieList[indexPath.row].overview
        
        
        
        //                DispatchQueue.global().async {
        //                    if let posterUrl = URL(string: "https://image.tmdb.org/t/p/w500/" + self.movieList[indexPath.row].image),
        //                       let posterData = try? Data(contentsOf: posterUrl),
        //                       let poster = UIImage(data: posterData) {
        //
        //                        DispatchQueue.main.async {
        //                            creditVC.movieThumnail = poster
        //                        }
        //                    }
        //                }
        
        guard let posterUrl = URL(string: "https://image.tmdb.org/t/p/w500/" + movieList[indexPath.row].image),
              let posterData = try? Data(contentsOf: posterUrl),
              let poster = UIImage(data: posterData) else {
            return
        }
        creditVC.movieThumnail = poster
        
        guard let headerUrl = URL(string: "https://image.tmdb.org/t/p/w500/" + movieList[indexPath.row].backimage),
              let headerData = try? Data(contentsOf: headerUrl),
              let header = UIImage(data: headerData) else {
            return
        }
        creditVC.movieBackThumnail = header
        

        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 490
    }
    
}


