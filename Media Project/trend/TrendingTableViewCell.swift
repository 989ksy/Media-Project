//
//  TrendingTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var trendingLabel: UILabel!
    
    @IBOutlet var imageBackview: UIView!
    @IBOutlet var posterImage: UIImageView!
    
    @IBOutlet var rateNameLabel: UILabel!
    @IBOutlet var rateNumberLabel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var castingLabel: UILabel!
    
    @IBOutlet var seperatorLineView: UIView!
    
    @IBOutlet var moreLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var clipButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.backgroundColor = .clear
        seperatorLineView.backgroundColor = .black
        
        dateLabel.font = .systemFont(ofSize: 13) //날짜
        dateLabel.textColor = .systemGray2
        trendingLabel.font = .boldSystemFont(ofSize: 19) //트렌드
        rateNameLabel.text = "평점" // 평점
        rateNameLabel.backgroundColor = .black
        rateNameLabel.textColor = .white
        rateNameLabel.font = .systemFont(ofSize: 13)
        rateNumberLabel.backgroundColor = .systemGray5
        rateNumberLabel.font = .systemFont(ofSize: 13)
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        castingLabel.font = .systemFont(ofSize: 14)
        
        moreLabel.text = "자세히 보기"
        moreLabel.font = .boldSystemFont(ofSize: 13)
        
        //버튼 설정
        
        moreButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        moreButton.setTitle("", for: .normal)
        moreButton.setTitleColor(.black, for: .normal)
        moreButton.tintColor = .black

        clipButton.setImage(UIImage(systemName: "paperclip.circle.fill"), for: .normal)
        clipButton.setTitle("", for: .normal)
        clipButton.tintColor = .black
        
        imageBackview.layer.cornerRadius = 20 //이미지의 흰 짜투리를 잘라줌
        posterImage.layer.shadowColor = UIColor.black.cgColor
        imageBackview.layer.shadowOffset = .zero //그림자 지는 방향
        imageBackview.layer.shadowRadius = 5 //그림자 번짐의 정도
        imageBackview.layer.shadowOpacity = 0.2 //불투명도
        imageBackview.clipsToBounds = false
        
        
    }

    
    
}
