//
//  BaseTextField.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

class BaseTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension BaseTextField {
    func configureApperance() {
        backgroundColor = R.Colors.background
        layer.borderWidth = 1
        layer.borderColor = R.Colors.grey.cgColor
        layer.cornerRadius = 20
        font = R.Fonts.bold(with: 18)
        clearButtonMode = .whileEditing
    }
}

