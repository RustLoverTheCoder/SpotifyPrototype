//
//  TestView.swift
//  SpotifyPrototype
//
//  Created by aiv on 02.12.2022.
//

import UIKit

class TestView: BaseView, UIScrollViewDelegate {
    private let scroll = UIScrollView()
    private let collection = ArtistsView()
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = R.Start.Images.background
        return image
    }()
}

extension TestView {
    override func setupViews() {
        super.setupViews()
        setupView(scroll)
        scroll.addSubview(collection)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collection.topAnchor.constraint(equalTo: scroll.topAnchor),
            collection.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            collection.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            collection.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            collection.trailingAnchor.constraint(equalTo: scroll.trailingAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        scroll.frame = CGRect(x: 0, y: 0, width: self.frame.width * 2, height: self.frame.height)
        scroll.contentSize = CGSize(width: 650, height: 200)
        scroll.delegate = self
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        
        collection.dataSource = self
        collection.delegate = self
        collection.register(ArtistViewCell.self, forCellWithReuseIdentifier: "ArtistViewCell")
        collection.frame.size = scroll.contentSize
    }
}

extension TestView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistViewCell", for: indexPath) as! ArtistViewCell
        
        return myCell
    }
}
