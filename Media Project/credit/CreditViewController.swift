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

class CreditViewController: BaseViewController {
    
    var creditList : Cast = Cast(id: 0, cast: [], crew: [])
    var selectedTrend : Result?

    let headerBack = {
        let view = UIView()
        return view
    }()
    let headerImage = {
        let view = UIImageView()
        return view
    }()

    let movieTitle = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    let moviePoster = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let overviewLabel = {
       let label = UILabel()
        label.text = "Overview"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .systemGray2
        return label
    }()
    
    let summaryLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let castingLabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .systemGray2
        return label
    }()
    
    let seperatorLine1 = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    let seperatorLine2 = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    let mainView = CreditView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "출연/제작"
        
        configureLayout()
        setLayout ()
        
        getData()
        
    }
    
    
    override func configureView() {
        super.configureView()
        mainView.castTableView.dataSource = self
        mainView.castTableView.delegate = self
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    
    
    func configureLayout () {
        view.addSubview(headerBack)
        headerBack.backgroundColor = .brown
        headerBack.addSubview(headerImage)
        headerImage.backgroundColor = .blue
        headerBack.addSubview(movieTitle)
        headerBack.addSubview(moviePoster)
        moviePoster.backgroundColor = .yellow
        
        view.addSubview(overviewLabel)
        view.addSubview(seperatorLine1)
        view.addSubview(summaryLabel)
        view.addSubview(seperatorLine2)
        view.addSubview(castingLabel)
        
    }
    
    func setLayout () {
        
        //상단 사진
        
        headerBack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        headerImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        moviePoster.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-230)
            make.bottom.equalToSuperview().offset(-13)
            make.height.equalTo(moviePoster.snp.width).multipliedBy(1.5)
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(headerBack.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(20)
        }
        
        seperatorLine1.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(seperatorLine1.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(120)
        }
        
        seperatorLine2.snp.makeConstraints { make in
            make.top.equalTo(summaryLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        castingLabel.snp.makeConstraints { make in
            make.top.equalTo(seperatorLine2.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(20)
            make.height.equalTo(20)
        }
    
        
    }
    
    func getData() {
        
        guard let selectedTrend = selectedTrend else {
            return
        }

        movieTitle.text = selectedTrend.title
        summaryLabel.text = selectedTrend.overview
        
        let sharedURL = "https://image.tmdb.org/t/p/w500/"
        
        if let posterURL = URL(string: sharedURL + selectedTrend.posterPath) {
            moviePoster.kf.setImage(with: posterURL)
        }
        
        if let headerURL = URL(string: sharedURL + selectedTrend.backdropPath) {
            headerImage.kf.setImage(with: headerURL)
        }
        
        callRequest(id: selectedTrend.id)
        
    }
    
    func callRequest(id : Int) {
        
        CreditManager.shared.callRequest(id: id) { data in
            print(data)
            self.creditList = data
            self.mainView.castTableView.reloadData()
            
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"CreditTableViewCell") as? CreditTableViewCell else { return UITableViewCell() }
        
        let credit = creditList.cast[indexPath.row]//castList[indexPath.row]
        cell.actorNameLabel.text = credit.name
        cell.roleNameLabel.text = credit.character
        if let profileURL = URL(string: "https://image.tmdb.org/t/p/w500/" + (credit.profilePath ?? "")) {
            cell.posterImage.kf.setImage(with: profileURL)
        }
        
//        NotificationCenter.default.post(name: NSNotication.Name("CastName"), object: nil, userInfo: [:])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        return tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    
    
}
