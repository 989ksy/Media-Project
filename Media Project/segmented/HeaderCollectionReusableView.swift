//
//  HeaderCollectionReusableView.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/18.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"
    
    @IBOutlet var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
