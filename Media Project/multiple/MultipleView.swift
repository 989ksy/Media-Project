//
//  MultipleView.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/09/01.
//

import UIKit

class MultipleView: BaseView {
    
    lazy var multipleTableView = {
        print("MTV 나옴")
        let view = UITableView()
        view.rowHeight = 150
        view.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        view.register(TVTableViewCell.self, forCellReuseIdentifier:"TVTableViewCell")
        view.register(PeopleTableViewCell.self, forCellReuseIdentifier:"PeopleTableViewCell")
        return view
    }()
    
    override func configureView() {
        self.addSubview(multipleTableView)
    }
    
    override func setConstraints() {
        
        multipleTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
    
    
}
