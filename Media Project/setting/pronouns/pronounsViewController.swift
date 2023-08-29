//
//  pronounsViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class PronounsViewController: BaseViewController {
    
    let mainView = PronounsView()
    
    var completionHandler : ((String) -> Void)?
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func configureView() {
        super.configureView()
        
        title = "성별 대명사"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        
    }
    
    override func setConstraints() {

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        completionHandler?(mainView.textField.text!)
        
    }
    
    @objc func doneButtonClicked() {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    
}
