//
//  CreditViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit


class CreditViewController: UIViewController {

    @IBOutlet var headerBack: UIView!
    @IBOutlet var headerImage: UIImageView!
    
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var moviePoster: UIImageView!
    
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    
    @IBOutlet var seperatorLine1: UIView! //구분선
    @IBOutlet var seperatorLine2: UIView!
    
    @IBOutlet var castingLabel: UILabel!
    
    @IBOutlet var castingTableView: UITableView!
    
    var movieName = ""
    var overView = ""
    var movieThumnail : UIImage?
    var movieBackThumnail: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "출연/제작"
        
        let nib = UINib(nibName: "CreditTableViewCell", bundle: nil)
        castingTableView.register(nib, forCellReuseIdentifier: "CreditTableViewCell")
        
        configureCell()
        getData()
        
        
    }
    
    func configureCell () {
        
        //라벨
        
        overviewLabel.text = "OverView"
        castingLabel.text = "Cast"
        
        movieTitle.font = .boldSystemFont(ofSize: 18)
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
        
        
    }
    
    func getData() {
        
        movieTitle.text = "\(movieName)"
        summaryLabel.text = "\(overView)"
        moviePoster.image = movieThumnail
        headerImage.image = movieBackThumnail
    }



}
