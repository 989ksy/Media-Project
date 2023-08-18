//
//  ReusableViewProtocol.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/18.
//

import UIKit

protocol ReusableViewProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
    static var identifier: String{
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    static var identifier: String{
        return String(describing: self)
    }
}

