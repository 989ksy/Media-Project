//
//  MultipleTableViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/09/01.
//

import UIKit
import Kingfisher

enum multiple : String {
    case movie = "MOVIE"
    case tv = "TV SHOW"
    case people = "PEOPLE"
}

class MultipleTableViewController: BaseViewController {
    
    var movieList : Trend = Trend(totalPages: 0, totalResults: 0, results: [], page: 0)
    var tvList : TV = TV(page: 0, results: [], totalPages: 0, totalResults: 0)
    var peopleList : People = People(page: 0, results: [], totalPages: 0, totalResults: 0)
    
    let sectionItems : [String] = ["Movie", "TV", "People"]
    
    var genreDictionary: [Int : String] = [
        28 : "Action", 12 : "Abenteuer", 16 : "Animation", 35 : "Komödie", 80 : "Krimi", 99 : "Dokumentarfilm", 18 : "Drama", 10751 : "Familie", 14 : "Fantasy", 36 : "Historie",27 : "Horror", 10402 : "Musik", 9648 : "Mystery", 10749 : "Liebesfilm", 878 : "Science Fiction", 10770 : "TV-Film", 53 : "Thriller", 10752 : "Kriegsfilm", 37 : "Western"
    ]
    
    
    let mainView = MultipleView()
    
    override func loadView() {
        self.view = mainView
    }

    override func configureView() {
        super.configureView()
        
//        callRequestTV()
//        callRequestMovie()
//        callRequestPeople()
        
        fetchData()
        
        title = "EXPLORE"

        mainView.multipleTableView.dataSource = self
        mainView.multipleTableView.delegate = self
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    func fetchData() {
        
        let group = DispatchGroup()
        
        //영화
        group.enter()
        TrendManager.shared.callRequestMovie { data in
            print("==Movie==",data)
            self.movieList = data
            self.mainView.multipleTableView.reloadData()
            
        } failure: {
            print("==failure, movie ==")
        }
        group.leave()
        
        //티비
        group.enter()
        TVManger.shared.callRequestTV { data in
            print("==TV==", data)
            self.tvList = data
            self.mainView.multipleTableView.reloadData()
            
        } failure: {
            print("==failure==, TV")
        }
        group.leave()
        
        //피플
        group.enter()
        PeopleManager.shared.callRequestPeople { data in
            print("==people==", data)
            self.peopleList = data
            self.mainView.multipleTableView.reloadData()
        } failure: {
            print("==failure==, people")
        }
        group.leave()
        
        group.notify(queue: .main) {
            print("큐 임무완료")
            self.mainView.multipleTableView.reloadData()
        }
        
    }
    
 
    
}

extension MultipleTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    //섹션 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    //섹션 헤더
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "MOVIE"
        } else if section == 1{
            return "TV SHOW"
        } else {
            return "PEOPLE"
        }
    }
    
    
    
    
    //셀
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return movieList.results.count
        } else if section == 1 {
            return tvList.results.count
        } else if section == 2 {
            return peopleList.results.count
        } else {
            return 0
        }
        
    }
    
    //셀 세부설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let headUrl = "https://image.tmdb.org/t/p/w500/"
        
        //영화
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else { return UITableViewCell()}
            
            if indexPath.row < movieList.results.count {
                
                let movie = movieList.results[indexPath.row]
                
                //제목, 개봉일
                cell.titleLabel.text = movie.title
                cell.releseLabel.text = movie.releaseDate
                
                //장르
                if let firstGenreID = movie.genreIDS.first, let genreName = genreDictionary[firstGenreID] {
                    cell.genreLabel.text = genreName
                } else {
                    cell.genreLabel.text = ""
                }
                
                //포스터
                if let url = URL(string: headUrl + movie.posterPath){
                    cell.posterImage.kf.setImage(with: url)
                }
            }
            
            return cell
           
        // 티비프로그램
        } else if indexPath.section == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVTableViewCell") as? TVTableViewCell else { return UITableViewCell() }
            
            if indexPath.row < tvList.results.count {
                
                let tv = tvList.results[indexPath.row]
                
                //제목, 줄거리
                cell.titleLabel.text = tv.name
                cell.overviewLabel.text = tv.overview
                
                //포서트
                if let url = URL(string: headUrl + (tv.posterPath ?? "") ){
                    cell.posterImage.kf.setImage(with: url)
                }
            }
            
            return cell
                
                
        } else if indexPath.section == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as? PeopleTableViewCell else { return UITableViewCell()}
            
            if indexPath.row < peopleList.results.count{
                
                let people = peopleList.results[indexPath.row]
                
                //프로필 사진
                if let url = URL(string: headUrl + (people.profilePath ?? "")) {
                    cell.profileImage.kf.setImage(with: url)
                }
                
                cell.nameLabel.text = people.name
                return cell
            }
            
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.reloadData()
    }
    
    
}
