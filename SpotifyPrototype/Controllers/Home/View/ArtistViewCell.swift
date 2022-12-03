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
        image.image = UIImage(systemName: "music.note.list")
        image.tintColor = R.Colors.white
        return image
    }()
    
    private let play: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "play")
        image.tintColor = R.Colors.white
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
    func setupViews() {
        setupView(backgroundImage)
        setupView(play)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
        backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
        backgroundImage.widthAnchor.constraint(equalToConstant: 65),
        backgroundImage.heightAnchor.constraint(equalToConstant: 60),
        
        play.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15),
        play.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
        ])
    }
    
    func configureApperance() {
        backgroundColor = R.Colors.secondary
        layer.cornerRadius = 30
        frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
    }
}
