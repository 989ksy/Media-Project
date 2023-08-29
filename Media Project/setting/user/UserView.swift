//
//  UserView.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class UserView: BaseView {
    
    let textField = {
        let view = UITextField()
        view.placeholder = "사용자 이름을 입력하세요."
        view.backgroundColor = .systemGray6
        return view
        
    }()
    
    
    override func configureView() {
        
        addSubview(textField)
        
    }
    
    override func setConstraints() {
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    
}
