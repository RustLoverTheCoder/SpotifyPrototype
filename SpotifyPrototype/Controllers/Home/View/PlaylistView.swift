//
//  PlaylistView.swift
//  SpotifyPrototype
//
//  Created by aiv on 02.12.2022.
//

import UIKit

class PlaylistView: BaseView {
    
    private let collection = ArtistsView()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = R.Start.Images.background
        return image
    }()
}

extension PlaylistView {
    override func setupViews() {
        super.setupViews()
        setupView(collection)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.centerYAnchor.constraint(equalTo: centerYAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        collection.dataSource = self
        collection.delegate = self
        collection.register(ArtistViewCell.self, forCellWithReuseIdentifier: "ArtistViewCell")
        
    }
}

extension PlaylistView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistViewCell", for: indexPath) as! ArtistViewCell
        
        return myCell
    }
}
