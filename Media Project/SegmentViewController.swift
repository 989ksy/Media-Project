//
//  SegmentViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/18.
//

import UIKit
import Alamofire
import Kingfisher

protocol CollectionViewAttributeProtocol {
    func configureCollectionView()
    func configureCollectionViewLayout()
}


class SegmentViewController: UIViewController {

    
    @IBOutlet var segmentCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    configureCollectionView()
    configureCollectionViewLayout()

        

    }//viewDid
    


}//class


extension SegmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentCollectionViewCell.identifier, for: indexPath) as? SegmentCollectionViewCell else { return UICollectionViewCell()}
        
        cell.segmentImage.backgroundColor = .brown
        
        return cell
        
    }
    
    
    //header_title 설정
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView()}
            
            view.headerLabel.text = "임시!"
            
            return view
            
        } else {
            
            return UICollectionReusableView()
            
        }
        
    }
    
    
    
} //



extension SegmentViewController: CollectionViewAttributeProtocol {
    
    func configureCollectionView() {
        
        segmentCollectionView.delegate = self
        segmentCollectionView.dataSource = self
        
        segmentCollectionView.register(UINib(nibName: SegmentCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SegmentCollectionViewCell.identifier)
        segmentCollectionView.register(UINib(nibName: HeaderCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func configureCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 160)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        layout.headerReferenceSize = CGSize(width: 300, height: 50)
        segmentCollectionView.collectionViewLayout = layout
        
        
    }
    
}//
