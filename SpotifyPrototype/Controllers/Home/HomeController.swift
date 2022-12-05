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
    private let artistView = NewAlbumView()
    private let segmentedControl = SegmentedControl(
        frame: CGRect(x: 0,
                      y: 0,
                      width: 0,
                      height: 0),
        buttonTitle: ["Playlists", "Artist", "Video", "Podcasts"])
    private let likedTracks = UITableView(frame: .zero, style: .insetGrouped)
    private let playlists = PlaylistView()
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()
    
    private let scrollView = UIScrollView()
    private let autoLayout: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
}

extension HomeController {
    override func setupViews() {
        autoLayout.addArrangedSubview(artistView)
        autoLayout.addArrangedSubview(segmentedControl)
        autoLayout.addArrangedSubview(playlists)
        autoLayout.addArrangedSubview(likedTracks)
        
        scrollView.addSubview(autoLayout)
        view.setupView(scrollView)
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 145),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            artistView.heightAnchor.constraint(equalToConstant: 140),
            artistView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            artistView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            artistView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            artistView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            segmentedControl.topAnchor.constraint(equalTo: artistView.bottomAnchor, constant: 30),
            segmentedControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50),
            
            playlists.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            playlists.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            playlists.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            playlists.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            playlists.heightAnchor.constraint(equalToConstant: 200),
            
            likedTracks.topAnchor.constraint(equalTo: playlists.bottomAnchor),
            likedTracks.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            likedTracks.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            likedTracks.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            likedTracks.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
             
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
        likedTracks.isScrollEnabled = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        autoLayout.frame.size = scrollView.contentSize
        
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
