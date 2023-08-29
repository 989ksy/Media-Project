//
//  SettingViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

class SettingViewController: BaseViewController {
    
    let mainView = SettingView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func configureView() {
        super.configureView()
        title = "프로필 편집"
        
        mainView.nameTextField.addTarget(self, action: #selector(nameTextFieldTouched), for: .editingDidBegin)
        mainView.userTextField.addTarget(self, action: #selector(userTextFieldTouched), for: .editingDidBegin)
        mainView.pronounsTextField.addTarget(self, action: #selector(pronounsTextFieldTouched), for: .editingDidBegin)
        mainView.introTextField.addTarget(self, action: #selector(introTextFieldTouched), for: .editingDidBegin)
        mainView.linkTextField.addTarget(self, action: #selector(linkTextFieldTouched), for: .editingDidBegin)

        
    }
    
    override func setConstraints() {
        
    }
    
    
    @objc func nameTextFieldTouched() {
        let vc = NameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func userTextFieldTouched() {
        let vc = UserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pronounsTextFieldTouched() {
        let vc = PronounsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func introTextFieldTouched() {
        let vc = IntroViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func linkTextFieldTouched() {
        let vc = LinkViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
