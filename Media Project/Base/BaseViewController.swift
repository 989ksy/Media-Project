//
//  BaseViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setConstraints()
        
    }
    
    func configureView() {
        view.backgroundColor = .white
        
    }
    
    func setConstraints() {
        
    }
    
    
    
}
