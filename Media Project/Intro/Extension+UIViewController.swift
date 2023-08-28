//
//  Extension+UIViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/26.
//

import UIKit

extension UIViewController {
    enum TransitoinStyle {
        case present
        case presentNavigation
        case presentFullNavigation
        case push
        case overCurrentContext
        case currentContext
    }
    
    func transition<T: UIViewController>(viewController: T.Type, storyboard: String, style: TransitoinStyle) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
            
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        case .overCurrentContext:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .overCurrentContext
            present(nav, animated: true)
        case .currentContext:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .currentContext
            present(nav, animated: true)
        }
        
    }
    
}
