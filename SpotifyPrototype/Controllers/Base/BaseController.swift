//
//  BaseController.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureApperance()
    }
}

@objc extension BaseController {
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureApperance() {
        view.backgroundColor = R.Colors.background
    }
}
