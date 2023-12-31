//
//  UserViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class UserViewController: BaseViewController {
    
    let mainView = UserView()
    
    override func loadView() {
        self.view = mainView
    }
    
    var delegate: PassUserDelegate?
    
    override func configureView() {
        super.configureView()
        
        title = "사용자 이름"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.receiveUsername(text: mainView.textField.text!)
    }
    
    
    override func setConstraints() {

    }
    
    @objc func doneButtonClicked() {
        print(#function)
        navigationController?.popViewController(animated: true)

    }
    
    
}

