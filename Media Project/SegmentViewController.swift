//
//  SegmentViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/18.
//


//영화 아이디 : 509 (노팅힐), 372058 (너의 이름은), 16996 (17어게인)


import UIKit
import Alamofire
import Kingfisher

protocol CollectionViewAttributeProtocol {
    func configureCollectionView()
    func configureCollectionViewLayout()
}


class SegmentViewController: UIViewController {

    //관련작 그릇
    var similarList : Similar = Similar(page: 0, results: [], totalPages: 0, totalResults: 0)
    var similarList2 : Similar = Similar(page: 0, results: [], totalPages: 0, totalResults: 0)
    var similarList3 : Similar = Similar(page: 0, results: [], totalPages: 0, totalResults: 0)
    
    //인기작 그릇
    var popularList : Popular = Popular(page: 0, results: [], totalPages: 0, totalResults: 0)
    
    var page = 1
    var id = 509
    let group = DispatchGroup()
    
    @IBOutlet var segmentCollectionView: UICollectionView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    configureCollectionView()
    configureCollectionViewLayout()
    configureSegmentedControl()
    
    fetchData ()
    
        
    }//viewDid
    
    
    //세그먼트 컨트롤
    func configureSegmentedControl() {
        segmentedControl.setTitle("관련작", forSegmentAt: 0)
        segmentedControl.setTitle("인기작", forSegmentAt: 1)
    }
    
    //dispatchGroup 통신
    func fetchData () {
        
        let group = DispatchGroup()
        
        //첫 번째 비동기 (노팅힐)
        group.enter()
        SimilarManager.shared.callRequestSimilarity(id: 509, page: page) { data in
            print("1")
            self.similarList = data
            group.leave()
            
        } failure: {
            print("error== 시뷰1")
            group.leave()
        }
        
        //두 번째 비동기 (너의 이름은)
        group.enter()
        SimilarManager.shared.callRequestSimilarity(id:372058 , page: page) { data in
            print("2")
            self.similarList2 = data
            group.leave()
            
        } failure: {
            print("error== 시뷰2")
            group.leave()
        }
        
        //세 번째 비동기 (17어게인)

        group.enter()
        SimilarManager.shared.callRequestSimilarity(id: 16996, page: page) { data in
            print("3")
            self.similarList3 = data
            group.leave()
            
        } failure: {
            print("error== 시뷰3")
            group.leave()
        }

        
        //네 번째 비동기
        group.enter()
        PopularManager.shared.callRequestUpcoming(page: page) { data in
            
            print("2")
            self.popularList = data
            group.leave()
            
        } failure: {
            print("error== 팝뷰")
            group.leave()
        }
        
        
        //작업 끝
        group.notify(queue: .main){
            print("임무완료")
            self.segmentCollectionView.reloadData()
        }
        
    }
    
    //관련작 데이터 가져오기
    func fetchDataSimilar() {

        SimilarManager.shared.callRequestSimilarity(id: id, page: page) { data in
            print(data)
            self.similarList = data
            self.segmentCollectionView.reloadData()

        } failure: {
            print("error")
        }
    }//sim

    
    //인기작 데이터 가져오기
    func fetchDataPopular() {

        PopularManager.shared.callRequestUpcoming(page: page) { data in

            print(data)
            self.popularList = data
            self.segmentCollectionView.reloadData()

        } failure: {
            print("error")
        }

    }//pop
    
    
    //세그먼트 컨트롤 - 데이터 전환
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    
        switch sender.selectedSegmentIndex {
        case 0:
            fetchDataSimilar()
        case 1:
            fetchDataPopular()
        default:
            break
        }
        
    }//
    
    
    

}//class


extension SegmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return 3
        case 1:
            return 1
        default:
            break
        }
        return segmentedControl.selectedSegmentIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentCollectionViewCell.identifier, for: indexPath) as? SegmentCollectionViewCell else { return UICollectionViewCell()}
        
        let sharedUrl = "https://image.tmdb.org/t/p/w500/"
        
        switch segmentedControl.selectedSegmentIndex {
            
        //관련작 보여줘
        case 0:
            if indexPath.section == 0 {
                if indexPath.row < similarList.results.count {
                    let url = "https://image.tmdb.org/t/p/w500/\(similarList.results[indexPath.item].posterPath ?? "")"
                    cell.segmentImage.kf.setImage(with: URL(string: url))
                } else {
                    cell.segmentImage.backgroundColor = .lightGray
                }
            } else if indexPath.section == 1 {
                if indexPath.row < similarList2.results.count {
                    let url = "https://image.tmdb.org/t/p/w500/\(similarList2.results[indexPath.item].posterPath ?? "")"
                    cell.segmentImage.kf.setImage(with: URL(string: url))
                } else {
                    cell.segmentImage.backgroundColor = .lightGray
                }
            } else if indexPath.section == 2 {
                if indexPath.row < similarList3.results.count {
                    let url = "https://image.tmdb.org/t/p/w500/\(similarList3.results[indexPath.item].posterPath ?? "")"
                    cell.segmentImage.kf.setImage(with: URL(string: url))
                } else {
                    cell.segmentImage.backgroundColor = .lightGray
                    print("관련작 오류?")
                }
            }

        //인기작 보여줘
        case 1:
            if indexPath.row < popularList.results.count{
                
                //포스터 보이기
                
                let popularCell = popularList.results[indexPath.row]
                let popularPosterPath = popularCell.posterPath
                
                if let url  = URL(string: sharedUrl + popularPosterPath!) {
                    cell.segmentImage.kf.setImage(with: url)
                } else {
                    cell.segmentImage.backgroundColor = .white
                }
            } else {
                    print("인기작 나옴?")
            }
        default:
            break
        }
                
        return cell
        
    }
    
    
    //header_title 설정
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {

            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView()}

            view.headerLabel.font = .boldSystemFont(ofSize: 19)
            
            //헤더 내용 설정
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                switch indexPath.section {
                case 0:
                    view.headerLabel.text = "노팅힐과 비슷한 영화"
                case 1:
                    view.headerLabel.text = "너의 이름은과 비슷한 영화"
                case 2:
                    view.headerLabel.text = "17어게인과 비슷한 영화"
                default:
                    break
                }
            case 1:
                view.headerLabel.text = "최신영화 인기 TOP 9"
            default:
                break
            }
            
            return view

        } else {

            return UICollectionReusableView()

        }

    }
    
    
    
} //extension collectionView



//뷰컨트롤러 UI 설정

extension SegmentViewController: CollectionViewAttributeProtocol {
    
    func configureCollectionView() {
        
        segmentCollectionView.delegate = self
        segmentCollectionView.dataSource = self
        
        segmentCollectionView.register(UINib(nibName: SegmentCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SegmentCollectionViewCell.identifier)
        
        segmentCollectionView.register(UINib(nibName: HeaderCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func configureCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 160)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        layout.headerReferenceSize = CGSize(width: 300, height: 64)
        segmentCollectionView.collectionViewLayout = layout
        
        
    }
    
}//
