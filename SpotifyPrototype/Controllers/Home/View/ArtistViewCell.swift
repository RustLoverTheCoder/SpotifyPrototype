//
//  ArtistViewCell.swift
//  SpotifyPrototype
//
//  Created by aiv on 02.12.2022.
//

import UIKit

class ArtistViewCell: UICollectionViewCell {
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ArtistViewCell {
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureApperance() {
        backgroundColor = R.Colors.salt
        layer.cornerRadius = 30
        frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
    }
}
