//
//  NavBarController.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super .viewDidLoad()
        configureApperance()
    }
    
    private func configureApperance() {
        view.backgroundColor = R.Colors.background
    }
}
