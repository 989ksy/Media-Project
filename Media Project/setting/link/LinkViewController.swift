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
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if let text = mainView.textField.text {
            let userInfo : [AnyHashable : Any] = ["textFieldText": text]
            NotificationCenter.default.post(name: .linkText, object: nil, userInfo: userInfo)
        }
    }
    
    @objc func doneButtonClicked() {
        print(#function)
        navigationController?.popViewController(animated: true)

    }
    
    
}

