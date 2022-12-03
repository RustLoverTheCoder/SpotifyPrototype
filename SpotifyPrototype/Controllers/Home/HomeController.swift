//
//  HomeController.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

class HomeController: BaseController {
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.spotifyLogo
        return image
    }()
    
    private let settings: UIButton = {
        let button = UIButton()
        button.setImage(R.Icons.threeDotHor , for: .normal)
        return button
    }()
    
    private let search: UIButton = {
        let button = UIButton()
        button.setImage(R.Icons.search , for: .normal)
        return button
    }()
    private let likedTracks = UITableView(frame: .zero, style: .insetGrouped)
    
    private let segmentedControl = SegmentedControl(
        frame: CGRect(x: 0,
                      y: 0,
                      width: 0,
                      height: 0),
        buttonTitle: ["Playlists", "Artist", "Video", "Podcasts"])
    
    private let artistView = NewAlbumView()
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()
    
    private let playlists = TestView()
}

extension HomeController {
    override func setupViews() {
        view.setupView(segmentedControl)
        view.setupView(artistView)
        view.setupView(playlists)
        view.setupView(likedTracks)
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 145),
            
            artistView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            artistView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            artistView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            artistView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            artistView.heightAnchor.constraint(equalToConstant: 140),
            
            segmentedControl.topAnchor.constraint(equalTo: artistView.bottomAnchor, constant: 30),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50),
            
            playlists.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15),
            playlists.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            playlists.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playlists.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playlists.heightAnchor.constraint(equalToConstant: 200),
            
            likedTracks.topAnchor.constraint(equalTo: playlists.bottomAnchor),
            likedTracks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            likedTracks.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likedTracks.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            likedTracks.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func configureApperance() {
        view.backgroundColor = R.Colors.background
        artistView.layer.cornerRadius = 30
        navigationItem.titleView = logo
        navigationItem.setRightBarButton(UIBarButtonItem(customView: settings), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: search), animated: true)
        likedTracks.backgroundColor = R.Colors.background
        likedTracks.separatorColor = R.Colors.background
        likedTracks.dataSource = self
        likedTracks.rowHeight = 65
        
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistViewCell", for: indexPath) as! ArtistViewCell
        return myCell
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return LikedTracksTVCell()
    }
}
