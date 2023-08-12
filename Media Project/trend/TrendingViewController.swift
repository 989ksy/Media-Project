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
}

class TrendingViewController: UIViewController {
    
    var movieList : [Movie] = []

    @IBOutlet var trendingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest ()
        
        trendingTableView.dataSource = self
        trendingTableView.delegate = self

        let nib = UINib(nibName: "TrendingTableViewCell", bundle: nil)
        trendingTableView.register(nib, forCellReuseIdentifier: "TrendingTableViewCell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
    
    }
    
    @objc func searchButtonClicked (_ sender: Any) {
        
        print("일단 존재")
        
    }
    
    func callRequest () {
        
        let url = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(APIKey.TmdbAPI)"
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(APIKey.TmdbAPI)",
            "accept" : "application/json"
        ]
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["results"].arrayValue {
                    
                    let date = item["release_date"].stringValue
                    let image = item["poster_path"].stringValue
                    let rate = item["vote_average"].doubleValue
                    let title = item["title"].stringValue
                    
                    let data = Movie(date: date, image: image, rate: rate, title: title)
                    self.movieList.append(data)
                    
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
        
        cell.titleLabel.text = movieList[indexPath.row].title
        cell.dateLabel.text = movieList[indexPath.row].date
        cell.rateNumberLabel.text = "\(movieList[indexPath.row].rate)"

        let headUrl = "https://image.tmdb.org/t/p/w500/"
        if let url = URL(string: headUrl + movieList[indexPath.row].image) {
            cell.posterImage.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        return  tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 490
    }
    
}


