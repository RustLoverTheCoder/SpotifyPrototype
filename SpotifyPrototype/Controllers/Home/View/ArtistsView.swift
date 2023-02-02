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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        layout.itemSize = CGSize(width: 135, height: 165)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: self.layout)
        
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureApperance() {
        showsHorizontalScrollIndicator = false
        backgroundColor = R.Colors.background
    }
}
