//
//  SettingViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/29.
//

import UIKit

protocol PassNameDelegate {
    func receiveName(text: String)
}

protocol PassUserDelegate{
    func receiveUsername(text: String)
}

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
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(linkNotificationObserver), name: NSNotification.Name("Link"), object: nil)
    }
    
    @objc func linkNotificationObserver(notification: NSNotification) {
        
        if let link = notification.userInfo?["textFieldText"] as? String {
            mainView.linkTextField.text = link
        }
        
    }
    
    
    @objc func nameTextFieldTouched() {
        let vc = NameViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func userTextFieldTouched() {
        let vc = UserViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pronounsTextFieldTouched() {
        let vc = PronounsViewController()
        
        vc.completionHandler = { c in
            self.mainView.pronounsTextField.text! = c
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func introTextFieldTouched() {
        let vc = IntroViewController()
        
        vc.completionHandler2 = { c in
            self.mainView.introTextField.text = c
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func linkTextFieldTouched() {
        let vc = LinkViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }

}


extension SettingViewController: PassNameDelegate {
    
    func receiveName(text: String) {
        mainView.nameTextField.text = text
    }
    
}

extension SettingViewController: PassUserDelegate {
    
    func receiveUsername(text: String) {
        mainView.userTextField.text = text
    }
    
}
