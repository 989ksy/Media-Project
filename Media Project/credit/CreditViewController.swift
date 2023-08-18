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

class CreditViewController: UIViewController {
    
    var creditList : Cast = Cast(id: 0, cast: [], crew: [])
    
    var selectedTrend : Result?

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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "출연/제작"
        
        let nib = UINib(nibName: CreditTableViewCell.identifier, bundle: nil)
        castingTableView.register(nib, forCellReuseIdentifier: CreditTableViewCell.identifier)
        
        castingTableView.dataSource = self
        castingTableView.delegate = self
        
        configureCell()
        getData()
        
        
    }
    
    func configureCell () {
        
        //라벨
        
        overviewLabel.text = "OverView"
        castingLabel.text = "Cast"
        
        movieTitle.font = .boldSystemFont(ofSize: 20)
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
        
        guard let selectedTrend = selectedTrend else {
            return
        }

        movieTitle.text = selectedTrend.title
        summaryLabel.text = selectedTrend.overview
        
        if let posterURL = URL(string: "https://image.tmdb.org/t/p/w500/" + selectedTrend.posterPath) {
            moviePoster.kf.setImage(with: posterURL)
        }
        
        if let headerURL = URL(string: "https://image.tmdb.org/t/p/w500/" + selectedTrend.backdropPath) {
            headerImage.kf.setImage(with: headerURL)
        }
        
        callRequest(id: selectedTrend.id)
        
    }
    
    func callRequest(id : Int) {
        
        CreditManager.shared.callRequest(id: id) { data in
            print(data)
            self.creditList = data
            self.castingTableView.reloadData()
            
        } failure: {
            print("error")
        }
    }

}

extension CreditViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditList.cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreditTableViewCell.identifier) as? CreditTableViewCell else { return UITableViewCell() }
        
        let credit = creditList.cast[indexPath.row]//castList[indexPath.row]
        cell.actorNameLabel.text = credit.name
        cell.roleNameLabel.text = credit.character
        if let profileURL = URL(string: "https://image.tmdb.org/t/p/w500/" + (credit.profilePath ?? "")) {
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
