//
//  ArtistsView.swift
//  SpotifyPrototype
//
//  Created by aiv on 02.12.2022.
//

import UIKit

class ArtistsView: UICollectionView {
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureApperance() {
        backgroundColor = R.Colors.background
    }
}
