//
//  CreditView.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/28.
//

import UIKit

class CreditView: BaseView {
    
    lazy var castTableView = {
        let view = UITableView()
        view.rowHeight = 130
        view.register(CreditTableViewCell.self, forCellReuseIdentifier: "CreditTableViewCell")
        return view
    }()
    
    override func configureView() {
        addSubview(castTableView)
    }
    
    override func setConstraints() {
        castTableView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(130)
        }
    }
    
    
}
