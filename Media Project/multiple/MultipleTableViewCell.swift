//
//  MultipleTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/09/01.
//

//MovieTableViewCell, TVTablieViewCell, PeopleTableViewCell

import UIKit

class MovieTableViewCell: BaseTableViewCell {
    
    let posterImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .black
        return view
    }()
    
    let genreLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .black
        return view
    }()
    
    let releseLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .black
        return view
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
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(genreLabel)
        addSubview(releseLabel)

    }
    
    override func setConstraints() {
        
        posterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        releseLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(5)
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
    }
    
    
}

class TVTableViewCell: BaseTableViewCell {
    
    let posterImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .black
        return view
    }()
    
    let overviewLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.textColor = .black
        view.numberOfLines = 0
        return view
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
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(overviewLabel)
    }
    
    override func setConstraints() {
        
        posterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(5)
        }

        
    }
    
}


class PeopleTableViewCell: BaseTableViewCell {
    
    let profileImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    let nameLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .black

        return view
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
        
        addSubview(profileImage)
        addSubview(nameLabel)
    
    }
    
    override func setConstraints() {
        
        profileImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalTo(profileImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
    }
    
}
