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
}

extension HomeController {
    override func setupViews() {}
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 145)
        ])
    }
    
    override func configureApperance() {
        view.backgroundColor = R.Colors.background
        navigationItem.titleView = logo
    }
}
