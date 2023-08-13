//
//  CreditViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

struct Cast {
    var name : String
    var profile : String
    var charactor : String
}

class CreditViewController: UIViewController {
    
    var selectedMovie : Movie?
    var castList : [Cast] = []

    @IBOutlet var headerBack: UIView!
    @IBOutlet var headerImage: UIImageView!
    
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var moviePoster: UIImageView!
    
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    
    @IBOutlet var seperatorLine1: UIView! //구분선
    @IBOutlet var seperatorLine2: UIView!
    
    @IBOutlet var castingLabel: UILabel!
    
    @IBOutlet var castingTableView: UITableView! //테이블뷰
    
    var movieName = ""
    var overView = ""
    var movieThumnail : UIImage?
    var movieBackThumnail: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "출연/제작"
        
        let nib = UINib(nibName: "CreditTableViewCell", bundle: nil)
        castingTableView.register(nib, forCellReuseIdentifier: "CreditTableViewCell")
        
        castingTableView.dataSource = self
        castingTableView.delegate = self
        
        configureCell()
        getData()
        
        
    }
    
    func configureCell () {
        
        //라벨
        
        overviewLabel.text = "OverView"
        castingLabel.text = "Cast"
        
        movieTitle.font = .boldSystemFont(ofSize: 17)
        overviewLabel.font = .boldSystemFont(ofSize: 15)
        summaryLabel.font = .systemFont(ofSize: 13)
        castingLabel.font = .boldSystemFont(ofSize: 15)
        
        movieTitle.textColor = .white
        overviewLabel.textColor = .systemGray2
        summaryLabel.textColor = .black
        castingLabel.textColor = .systemGray2
        
        summaryLabel.numberOfLines = 0
        
        //구분선
        
        seperatorLine1.backgroundColor = .systemGray2
        seperatorLine2.backgroundColor = .systemGray2
        
        //이미지
        
        moviePoster.layer.cornerRadius = 10
        
        
    }
    
    func getData() {
        
        guard let selectedMovie = selectedMovie else {
            return
        }
        
        movieTitle.text = "\(movieName)"
        summaryLabel.text = "\(overView)"
        moviePoster.image = movieThumnail
        headerImage.image = movieBackThumnail
        
        callRequest(id: selectedMovie.movieID)
    }
    
    func callRequest(id : Int) {
        
        let url = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=\(APIKey.TmdbAPI)"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for role in json["cast"].arrayValue {
                    
                    let name = role["name"].stringValue
                    let profile = role["profile_path"].stringValue
                    let character = role["character"].stringValue
                    
                    let castData = Cast(name: name, profile: profile, charactor: character)
                    self.castList.append(castData)
                    
                }
                
                self.castingTableView.reloadData()
                
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

}

extension CreditViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return castList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditTableViewCell") as! CreditTableViewCell
        
        let cast = castList[indexPath.row]
        cell.actorNameLabel.text = cast.name
        cell.roleNameLabel.text = cast.charactor
        if let profileURL = URL(string: "https://image.tmdb.org/t/p/w500/\(cast.profile)") {
            cell.posterImage.kf.setImage(with: profileURL)
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    
    
}
