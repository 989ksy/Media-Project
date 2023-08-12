//
//  TrendTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit

class TrendTableViewCell: UITableViewCell {
    
    static let identifier = "TrendTableViewCell"

    @IBOutlet var entireView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var hashtagLabel: UILabel!
    
    @IBOutlet var backView: UIView!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    @IBOutlet var seperatorLineView: UIView!
    @IBOutlet var moreLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    
    @IBOutlet var rateTitleLabel: UILabel!
    @IBOutlet var rateNumberLabel: UILabel!
    
    @IBOutlet var extraButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell () {
        
        //라벨 설정
        
        dateLabel.font = .systemFont(ofSize: 13) //날짜
        dateLabel.textColor = .systemGray5
        hashtagLabel.font = .boldSystemFont(ofSize: 15) //트렌드
        rateTitleLabel.text = "평점" // 평점
        rateTitleLabel.backgroundColor = .purple
        rateTitleLabel.textColor = .white
        rateTitleLabel.font = .systemFont(ofSize: 13)
        rateNumberLabel.backgroundColor = .white
        rateNumberLabel.font = .systemFont(ofSize: 13)
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        subLabel.font = .systemFont(ofSize: 14)
        
        moreLabel.text = "자세히 보기"
        
        //버튼 설정
        
        moreButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        extraButton.setImage(UIImage(systemName: "paperclip.circle"), for: .normal)
        
        
    }

}
