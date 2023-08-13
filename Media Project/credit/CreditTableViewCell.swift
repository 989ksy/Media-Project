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

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}