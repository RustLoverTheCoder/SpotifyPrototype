//
//  BackButton.swift
//  SpotifyPrototype
//
//  Created by aiv on 30.11.2022.
//

import UIKit

class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureApperance() {
        backgroundColor = R.Colors.white.withAlphaComponent(0.1)
        setImage(R.Icons.back, for: .normal)
        layer.cornerRadius = frame.size.height / 2
    }
}
