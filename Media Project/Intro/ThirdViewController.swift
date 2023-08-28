//
//  ThirdViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/26.
//

import UIKit
import SnapKit

class ThirdViewController: UIPageViewController {
    
    let startButton = {
        
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()

    }
    
    
    @objc func startButtonClicked(){
        print("시작~")
        
        transition(viewController: TrendingViewController.self, storyboard: "Main", style: .currentContext)
        
    }
    
    func setupLayout() {
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(60)
        }
        
    }
    


}
