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


class TrendingViewController: UIViewController {
    
    var trendList: Trend = Trend(totalPages: 0, totalResults: 0, results: [], page: 0)
    
    var genreDictionary: [Int : String] = [
        28 : "Action", 12 : "Abenteuer", 16 : "Animation", 35 : "Komödie", 80 : "Krimi", 99 : "Dokumentarfilm", 18 : "Drama", 10751 : "Familie", 14 : "Fantasy", 36 : "Historie",27 : "Horror", 10402 : "Musik", 9648 : "Mystery", 10749 : "Liebesfilm", 878 : "Science Fiction", 10770 : "TV-Film", 53 : "Thriller", 10752 : "Kriegsfilm", 37 : "Western"
    ]
    
    @IBOutlet var trendingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        callRequestMovie ()

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
    
    func callRequestMovie () {
 

        TrendManager.shared.callRequestMovie { data in
            print(data)
            self.trendList = data
            self.trendingTableView.reloadData()
            
        } failure: {
            print("error")
        }

    }
    
    
} //class



extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendList.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.identifier) as?  TrendingTableViewCell else {return UITableViewCell() }
        
        let trend = trendList.results[indexPath.row]
        
        cell.titleLabel.text = trendList.results[indexPath.row].title
        cell.dateLabel.text = trendList.results[indexPath.row].releaseDate
        cell.rateNumberLabel.text = "\(trendList.results[indexPath.row].voteAverage)"
        
        cell.castingLabel.text = ""
        
        let headUrl = "https://image.tmdb.org/t/p/w500/"
        if let url = URL(string: headUrl + trendList.results[indexPath.row].posterPath){
            cell.posterImage.kf.setImage(with: url)
        }
        
        if let firstGenreID = trend.genreIDS.first, let genreName = genreDictionary[firstGenreID] {
            cell.trendingLabel.text = genreName
        } else {
            cell.trendingLabel.text = ""
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let creditVC = self.storyboard?.instantiateViewController(withIdentifier: "CreditViewController") as? CreditViewController else { return }
        self.navigationController?.pushViewController(creditVC, animated: true)
        
        
        let selectedTrend = trendList.results[indexPath.row]
        
        creditVC.selectedTrend = selectedTrend
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 490
    }
    
}


