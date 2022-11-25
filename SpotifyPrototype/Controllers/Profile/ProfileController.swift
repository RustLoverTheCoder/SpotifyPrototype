//
//  ProfileController.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

class ProfileController: BaseController {
    private let backView = ProfileView()
    private let likedTracks = UITableView(frame: .zero, style: .insetGrouped)
    
    private let settings: UIButton = {
        let button = UIButton()
        button.setImage(R.Icons.threeDot, for: .normal)
        return button
    }()
    
}

extension ProfileController {
    override func setupViews() {
        view.setupView(backView)
        view.setupView(likedTracks)
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            likedTracks.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 5),
            likedTracks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            likedTracks.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likedTracks.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configureApperance() {
        view.backgroundColor = R.Colors.background
        backView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        backView.layer.cornerRadius = 45
        likedTracks.backgroundColor = R.Colors.background
        likedTracks.separatorColor = R.Colors.background
        
        navigationItem.title = R.Profile.Texts.profile
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settings)
        likedTracks.dataSource = self
        likedTracks.rowHeight = 65
        
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return LikedTracksTVCell()
    }
}
