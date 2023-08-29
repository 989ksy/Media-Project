//
//  LinkViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class LinkViewController: BaseViewController {
    
    let mainView = LinkView()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func configureView() {
        super.configureView()
        
        title = "주소"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        
    }
    
    override func setConstraints() {

    }
    
    @objc func doneButtonClicked() {
        print(#function)
    }
    
    
}

