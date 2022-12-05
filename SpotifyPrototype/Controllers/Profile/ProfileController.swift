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
    
    private let autoLayout: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
}

extension ProfileController {
    override func setupViews() {
        autoLayout.addArrangedSubview(backView)
        autoLayout.addArrangedSubview(likedTracks)
        scrollView.addSubview(autoLayout)
        view.setupView(scrollView)
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            autoLayout.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -50),
            autoLayout.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            autoLayout.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            autoLayout.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            backView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -100)
        ])
    }
    
    override func configureApperance() {
        navigationItem.title = R.Profile.Texts.profile
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settings)

        backView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        backView.layer.cornerRadius = 45

        likedTracks.backgroundColor = R.Colors.background
        likedTracks.separatorColor = R.Colors.background
        likedTracks.isScrollEnabled = false
        likedTracks.dataSource = self
        likedTracks.rowHeight = 65

        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.9)
        autoLayout.frame.size = scrollView.contentSize
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
