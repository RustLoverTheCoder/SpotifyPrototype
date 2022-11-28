//
//  NewAlbumView.swift
//  SpotifyPrototype
//
//  Created by aiv on 28.11.2022.
//

import UIKit

class NewAlbumView: BaseView {
    private let artistView: UIImageView = {
        let image = UIImageView()
        image.image = R.Home.Images.artist
        return image
    }()
}

extension NewAlbumView {
    override func setupViews() {
        super.setupViews()
        setupView(artistView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            artistView.centerXAnchor.constraint(equalTo: centerXAnchor),
            artistView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    override func configureApperance() {
        super.configureApperance()
        backgroundColor = R.Colors.salt
    }
}
