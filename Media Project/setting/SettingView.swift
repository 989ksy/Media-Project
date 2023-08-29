//
//  SettingView.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class SettingView: BaseView {
    
    let profileImage = {
        let view = UIImageView()
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let changeImageButton  = {
        let view = UIButton()
        view.setTitle("사진 수정", for: .normal)
        view.setTitleColor(UIColor.blue, for: .normal)
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    let seperateLine = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let nameLabel = {
       let view = UILabel()
        view.text = "이름"
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .black
        return view
    }()
    
    let userLabel = {
       let view = UILabel()
        view.text = "사용자 이름"
        view.font = .boldSystemFont(ofSize: 16)
        view.textColor = .black
        return view
    }()
    
    let pronounsLabel = {
       let view = UILabel()
        view.text = "성별 대명사"
        view.font = .boldSystemFont(ofSize: 15)
        view.textColor = .black
        return view
    }()
    
    let introLabel = {
       let view = UILabel()
        view.text = "소개"
        view.font = .boldSystemFont(ofSize: 15)
        view.textColor = .black
        return view
    }()
    
    let linkLabel = {
       let view = UILabel()
        view.text = "링크"
        view.font = .boldSystemFont(ofSize: 15)
        view.textColor = .black
        return view
    }()
    
    //
    
    let nameTextField = {
       let view = UITextField()
        view.placeholder = "이름"
        view.font = .systemFont(ofSize: 15)
        view.backgroundColor = .systemGray6
        view.textColor = .black
        return view
    }()
    
    let userTextField = {
        let view = UITextField()
         view.placeholder = "사용자 이름"
         view.font = .systemFont(ofSize: 15)
         view.backgroundColor = .systemGray6
         view.textColor = .black
         return view
    }()
    
    let pronounsTextField = {
        let view = UITextField()
         view.placeholder = "성별 대명사"
         view.font = .systemFont(ofSize: 15)
         view.backgroundColor = .systemGray6
         view.textColor = .black
         return view
    }()
    
    let introTextField = {
        let view = UITextField()
         view.placeholder = "소개"
         view.font = .systemFont(ofSize: 15)
         view.backgroundColor = .systemGray6
         view.textColor = .black
         return view
    }()
    
    let linkTextField = {
        let view = UITextField()
         view.placeholder = "링크"
         view.font = .systemFont(ofSize: 15)
         view.backgroundColor = .systemGray6
         view.textColor = .black
         return view
    }()
    
    
    
    override func configureView() {
        addSubview(profileImage)
        addSubview(changeImageButton)
        
        addSubview(seperateLine)
        
        addSubview(nameLabel)
        addSubview(nameTextField)
        
        addSubview(userLabel)
        addSubview(userTextField)
        
        addSubview(pronounsLabel)
        addSubview(pronounsTextField)
        
        addSubview(introLabel)
        addSubview(introTextField)
        
        addSubview(linkLabel)
        addSubview(linkTextField)


        
    }
    
    override func setConstraints() {
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(100)
        }
        
        changeImageButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        seperateLine.snp.makeConstraints { make in
            make.top.equalTo(changeImageButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(seperateLine).offset(10)
            make.leading.equalTo(20)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(seperateLine).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(nameLabel.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        userLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.leading.equalTo(20)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(userLabel.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        pronounsLabel.snp.makeConstraints { make in
            make.top.equalTo(userLabel.snp.bottom).offset(12)
            make.leading.equalTo(20)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        pronounsTextField.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(userLabel.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        introLabel.snp.makeConstraints { make in
            make.top.equalTo(pronounsLabel.snp.bottom).offset(12)
            make.leading.equalTo(20)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        introTextField.snp.makeConstraints { make in
            make.top.equalTo(pronounsTextField.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(pronounsLabel.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        linkLabel.snp.makeConstraints { make in
            make.top.equalTo(introLabel.snp.bottom).offset(12)
            make.leading.equalTo(20)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
        
        linkTextField.snp.makeConstraints { make in
            make.top.equalTo(introTextField.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(introLabel.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
    
        
    }
    
    
    
}
