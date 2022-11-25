//
//  BaseView.swift
//  SpotifyPrototype
//
//  Created by aiv on 25.11.2022.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureApperance() {
        
    }
}
