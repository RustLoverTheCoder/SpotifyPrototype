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
}

extension HomeController {
    override func setupViews() {
        view.setupView(artistView)
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 145),
            
            artistView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            artistView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            artistView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            artistView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            artistView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    override func configureApperance() {
        view.backgroundColor = R.Colors.background
        artistView.layer.cornerRadius = 30
        navigationItem.titleView = logo
        navigationItem.setRightBarButton(UIBarButtonItem(customView: settings), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: search), animated: true)
    }
}
