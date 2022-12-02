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
    private let scrollView = UIScrollView()
    private let settings: UIButton = {
        let button = UIButton()
        button.setImage(R.Icons.threeDot, for: .normal)
        return button
    }()
    
}

extension ProfileController {
    override func setupViews() {
        scrollView.addSubview(backView)
        scrollView.addSubview(likedTracks)
        view.setupView(scrollView)
        /*
        view.setupView(backView)
        view.setupView(likedTracks)
         */
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            /*
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 200),
            */
            backView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            likedTracks.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 5),
            likedTracks.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            likedTracks.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            likedTracks.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            likedTracks.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
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
        
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 2)
        scrollView.backgroundColor = R.Colors.white
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.delegate = self
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

extension ProfileController: UIScrollViewDelegate {
    
}
