//
//  nameViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.

// protocol로 값 전달 받기

import UIKit

class NameViewController: BaseViewController {
    
    let mainView = NameView()
    
    var delegate: PassNameDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func configureView() {
        super.configureView()
        
        title = "이름"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        
    }
    
    override func setConstraints() {

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        delegate?.receiveName(text: mainView.textField.text!)
    }
    
    @objc func doneButtonClicked() {
        print(#function)
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
