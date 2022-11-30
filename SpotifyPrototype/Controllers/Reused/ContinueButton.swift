//
//  ContinueButton.swift
//  SpotifyPrototype
//
//  Created by aiv on 30.11.2022.
//

import UIKit

enum ButtonColor {
    case salt
    case clear
}

final class ContinueButton: UIButton {
    private var type: ButtonColor = .salt
    private var title: String = ""
    
    init(title: String, type: ButtonColor) {
        super.init(frame: .zero)
        self.type = type
        setTitle(title, for: .normal)
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureApperance() {
        switch type {
        case .salt:
            backgroundColor = R.Colors.salt
        case .clear:
            backgroundColor = R.Colors.salt.withAlphaComponent(0)
        }
        
        titleLabel?.font = R.Fonts.bold(with: 22)
        titleLabel?.textColor = R.Colors.white
        layer.cornerRadius = 35
    }
}
