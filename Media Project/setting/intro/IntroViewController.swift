//
//  IntroViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class IntroViewController: BaseViewController {
    
    let mainView = IntroView()
    
    var completionHandler2: ((String) -> Void)?
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func configureView() {
        super.configureView()
        
        title = "소개"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        
    }
    
    override func setConstraints() {

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        completionHandler2?(mainView.textField.text!) //이게 c값
        
    }
    
    
    @objc func doneButtonClicked() {
        print(#function)
        navigationController?.popViewController(animated: true)

    }
    
    
}
