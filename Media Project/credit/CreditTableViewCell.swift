//
//  CreditTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit

class CreditTableViewCell: BaseTableViewCell {
    
    let imageBackView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 20
        return view
    }()
    
    let posterImage = {
        let view = UIImageView()
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        return view
    }()
    
    let actorNameLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    let roleNameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func configureView() {
        
        contentView.addSubview(imageBackView)
        imageBackView.backgroundColor = .yellow
        imageBackView.addSubview(posterImage)
        contentView.addSubview(actorNameLabel)
        contentView.addSubview(roleNameLabel)
    }
    
    override func setConstraints() {
        
        imageBackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(120)
        }
        
        posterImage.snp.makeConstraints { make in
            make.edges.equalTo(imageBackView)

        }

        actorNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(imageBackView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }

        roleNameLabel.snp.makeConstraints { make in
            make.top.equalTo(actorNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(imageBackView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
        
        
    }
    
    
    
    
}
