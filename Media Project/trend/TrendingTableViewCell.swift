//
//  TrendingTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit

class TrendingTableViewCell: BaseTableViewCell {
    
    let seperatorLineView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    //라벨
    
    let dateLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemGray2
        return label
    }()
    
    let trendingLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    let rateNameLabel = {
        let label = UILabel()
        label.text = "평점" // 평점
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let rateNumberLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray5
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let titleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    let castingLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let moreLabel = {
        let label = UILabel()
        label.text = "자세히 보기"
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    let originalTitleLabel = {
        let label = UILabel()
        return label
    }()
    
    //버튼
    
    let moreButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "chevron.right", withConfiguration: imageConfig)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    let clipButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light)
        let image = UIImage(systemName: "paperclip.circle.fill", withConfiguration: imageConfig)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    //이미지
    
    let imageBackview = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.clipsToBounds = false
        return view
    }()
    
    let posterBackView = {
        let view = UIView()
        return view
    }()
    
    let posterImage = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.shadowColor = UIColor.black.cgColor
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
//        contentView.addSubview(backView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(trendingLabel)
        
        contentView.addSubview(imageBackview)
        imageBackview.backgroundColor = .white
        imageBackview.addSubview(posterBackView)
//        posterBackView.backgroundColor = .yellow
        posterBackView.addSubview(posterImage)
        imageBackview.addSubview(clipButton)
        imageBackview.addSubview(titleLabel)
        imageBackview.addSubview(rateNameLabel)
        imageBackview.addSubview(rateNumberLabel)
        imageBackview.addSubview(titleLabel)
        imageBackview.addSubview(originalTitleLabel)
        imageBackview.addSubview(castingLabel)
        imageBackview.addSubview(seperatorLineView)
        imageBackview.addSubview(moreLabel)
        imageBackview.addSubview(moreButton)
    }
    
    override func setConstraints() {
        
        //상단
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(20)
        }
        trendingLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(20)
        }
        
        imageBackview.snp.makeConstraints { make in
            make.top.equalTo(trendingLabel.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().inset(20)
        }
        
        posterBackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.55)
        }

        posterImage.snp.makeConstraints { make in
            
            make.top.equalToSuperview().offset(10)
            make.center.equalToSuperview()
////            make.edges.equalTo(posterBackView)
//            make.top.equalTo(posterBackView.snp.top).inset(20)
//            make.bottom.equalTo(posterBackView.snp.bottom).offset(-20)
//            make.centerX.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.4)
        }

        clipButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }

        rateNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().inset(150)
            make.height.equalTo(15)
        }

        rateNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(rateNameLabel.snp.trailing).offset(0)
            make.bottom.equalToSuperview().inset(150)
            make.bottom.equalToSuperview()
            make.height.equalTo(15)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }

//        originalTitleLabel.snp.makeConstraints { make in
//            make.top.equalTo(posterImage.snp.bottom).offset(10)
//            make.leading.equalTo(titleLabel).offset(10)
//            make.trailing.equalToSuperview().inset(20)
//            make.height.equalTo(20)
//        }

        castingLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }

        seperatorLineView.snp.makeConstraints { make in
            make.top.equalTo(castingLabel.snp.bottom).offset(12)
            make.leading.equalTo(imageBackview.snp.leading).offset(20)
            make.trailing.equalTo(imageBackview.snp.trailing).offset(-20)
            make.height.equalTo(1)
        }

        moreLabel.snp.makeConstraints { make in
            make.top.equalTo(seperatorLineView.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.bottom.equalTo(imageBackview.snp.bottom).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalTo(moreButton)
        }

        moreButton.snp.makeConstraints { make in
            make.top.equalTo(seperatorLineView.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.bottom.equalTo(imageBackview.snp.bottom).inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(moreLabel)
        }

        
        
        
    }

    
    
}
