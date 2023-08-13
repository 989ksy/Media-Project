//
//  CreditTableViewCell.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit

class CreditTableViewCell: UITableViewCell {

    @IBOutlet var imageBackView: UIView!
    @IBOutlet var posterImage: UIImageView!
    
    @IBOutlet var actorNameLabel: UILabel!
    @IBOutlet var roleNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCell ()
        
    }
    
    func configureCell () {
        
        //이미지 설정
        
        imageBackView.backgroundColor = .clear
        imageBackView.layer.cornerRadius = 20
        posterImage.layer.cornerRadius = 18
        
        //라벨 설정
        
        actorNameLabel.font = .boldSystemFont(ofSize: 17)
        roleNameLabel.font = .systemFont(ofSize: 13)
        roleNameLabel.textColor = .gray
        
    }
    
}
