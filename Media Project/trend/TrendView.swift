//
//  TrendView.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/28.
//

import UIKit

class TrendView: BaseView {
    
    lazy var trendTableView = {
        print("나온다")
        let view = UITableView()
        view.rowHeight = 490
        view.register(TrendingTableViewCell.self, forCellReuseIdentifier: "TrendingTableViewCell")
        return view
    }()
    
    
    override func configureView() {
        self.addSubview(trendTableView)
    }
    
    override func setConstraints() {
        trendTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
