//
//  ChooseController.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

class ChooseController: BaseController {
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = R.BackgroundImage.first
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.logo
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.Text.GetStarted.titleText
        label.textColor = R.Colors.white
        label.font = R.Fonts.bold(with: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let textInfo: UILabel = {
        let label = UILabel()
        label.text = R.Text.GetStarted.textInfo
        label.textColor = R.Colors.grey
        label.font = R.Fonts.bold(with: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.Colors.salt
        button.setTitle(R.Text.GetStarted.getStarted, for: .normal)
        button.titleLabel?.font = R.Fonts.bold(with: 22)
        button.titleLabel?.textColor = R.Colors.white
        button.layer.cornerRadius = 35
        return button
    }()
    

}

extension ChooseController {
    override func setupViews() {
        super.setupViews()
        view.setupView(backgroundImage)
        view.setupView(logo)
        view.setupView(titleLabel)
        view.setupView(textInfo)
        view.setupView(button)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: textInfo.topAnchor, constant: -15),
            
            textInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            textInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            textInfo.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            
            button.heightAnchor.constraint(equalToConstant: 70),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
        
    }
    
    override func configureApperance() {
        super.configureApperance()
        view.backgroundColor = R.Colors.black
        button.makeSystem(button)
    }
}
