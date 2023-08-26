//
//  FirstViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/26.
//

import UIKit
import SnapKit

class FirstViewController: UIPageViewController {
    
    let mainImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "영화 상세")
        return view
    }()
    
    let mainContentLabel = {
        let label = UILabel()
        label.text = "다양한 영화 정보를 한번에 😎"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    let subContentLabel = {
        let label = UILabel()
        label.text = """
        장르, 제목, 평점, 줄거리, 캐스팅 등
        전세계 다양한 영화 정보를 한번에 볼 수 있어요!
        """
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setLabelandicon()
    }
    
    func setLabelandicon() {
        
        view.addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.size.equalTo(280)
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        
        view.addSubview(mainContentLabel)
        mainContentLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(60)
            make.height.equalTo(24)
            make.centerX.equalTo(mainImageView)
        }

        
        view.addSubview(subContentLabel)
        subContentLabel.snp.makeConstraints { make in
            make.top.equalTo(mainContentLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.centerX.equalTo(mainContentLabel)


        }
        
        
        
    }
    



}
