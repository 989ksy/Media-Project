//
//  BaseTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/28.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        func configureView() {}
        func setConstraints() {}
        
//        backgroundColor = .green
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {}
    func setConstraints() {}
    
    
    
}
