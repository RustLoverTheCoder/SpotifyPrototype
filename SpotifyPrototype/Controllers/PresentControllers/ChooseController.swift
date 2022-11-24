//
//  ChooseController.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

class ChooseController: BaseController {
    let navigationBar = NavBarController()
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = R.Choose.Images.background
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.spotifyLogo
        return image
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.Colors.salt
        button.setTitle(R.Choose.Texts.continued, for: .normal)
        button.titleLabel?.font = R.Fonts.bold(with: 22)
        button.titleLabel?.textColor = R.Colors.white
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(getNextController), for: .touchUpInside)
        return button
    }()
    
    private let darkModeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.Colors.white.withAlphaComponent(0.3)
        button.setImage(R.Choose.Icons.darkMode, for: .normal)
        button.layer.cornerRadius = 40
        return button
    }()
    
    private let darkModeText: UILabel = {
        let label = UILabel()
        label.text = R.Choose.Texts.darkMode
        label.font = R.Fonts.bold(with: 16)
        return label
    }()
    
    private let darkModeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let lightModeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.Colors.white.withAlphaComponent(0.3)
        button.setImage(R.Choose.Icons.lightMode, for: .normal)
        button.layer.cornerRadius = 40
        return button
    }()
    
    private let lightModeText: UILabel = {
        let label = UILabel()
        label.text = R.Choose.Texts.lightMode
        label.font = R.Fonts.bold(with: 16)
        return label
    }()
    
    private let lightModeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let chooseModeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 50
        return stackView
    }()
    
    private let chooseModeText: UILabel = {
        let label = UILabel()
        label.text = R.Choose.Texts.chooseMode
        label.font = R.Fonts.bold(with: 20)
        return label
    }()
    
    @objc func getNextController() {
        let nextController = RegOrSignController()
        nextController.modalPresentationStyle = .overCurrentContext
        self.present(nextController, animated: true)
    }
}

extension ChooseController {
    override func setupViews() {
        super.setupViews()
        darkModeStackView.addArrangedSubview(darkModeButton)
        darkModeStackView.addArrangedSubview(darkModeText)
        lightModeStackView.addArrangedSubview(lightModeButton)
        lightModeStackView.addArrangedSubview(lightModeText)
        chooseModeStackView.addArrangedSubview(darkModeStackView)
        chooseModeStackView.addArrangedSubview(lightModeStackView)
        
        view.setupView(backgroundImage)
        view.setupView(logo)
        view.setupView(chooseModeStackView)
        view.setupView(button)
        view.setupView(chooseModeText)
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
            
            chooseModeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseModeText.bottomAnchor.constraint(equalTo: chooseModeStackView.topAnchor, constant: -30),
            
            chooseModeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseModeStackView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -60),
            chooseModeStackView.heightAnchor.constraint(equalToConstant: 110),
            
            button.heightAnchor.constraint(equalToConstant: 70),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        view.backgroundColor = R.Colors.white
        button.makeSystem(button)
        darkModeStackView.makeSystem(darkModeButton)
        lightModeStackView.makeSystem(lightModeButton)
    }
}
