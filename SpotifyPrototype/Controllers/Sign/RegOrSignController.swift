//
//  RegOrSignController.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

class RegOrSignController: BaseController {
    private let registerButton = ContinueButton(title: R.RegOrSig.Texts.register, type: .salt)
    private let signInButton = ContinueButton(title: R.RegOrSig.Texts.signIn, type: .clear)
    private let backButton = BackButton()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = R.RegOrSig.Images.background
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.spotifyLogo
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.RegOrSig.Texts.titleText
        label.textColor = R.Colors.white
        label.font = R.Fonts.bold(with: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let textInfo: UILabel = {
        let label = UILabel()
        label.text = R.RegOrSig.Texts.textInfo
        label.textColor = R.Colors.grey
        label.font = R.Fonts.bold(with: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
 
    private let textStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    @objc func signIn() {
        let signIn = NavBarController(rootViewController: SignInController())
        signIn.modalPresentationStyle = .overCurrentContext
        self.present(signIn, animated: true)
    }
    
    @objc func getBack() {
        self.dismiss(animated: true)
    }
    
}

extension RegOrSignController {
    override func setupViews() {
        super.setupViews()
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(textInfo)
        buttonStack.addArrangedSubview(registerButton)
        buttonStack.addArrangedSubview(signInButton)
        stack.addArrangedSubview(textStack)
        stack.addArrangedSubview(buttonStack)
        
        view.setupView(backButton)
        view.setupView(backgroundImage)
        view.setupView(logo)
        view.setupView(stack)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -50),
            
            registerButton.heightAnchor.constraint(equalToConstant: 80),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            signInButton.heightAnchor.constraint(equalToConstant: 80),
            signInButton.widthAnchor.constraint(equalToConstant: 150),
            
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        view.backgroundColor = R.Colors.background
        backButton.addTarget(self, action: #selector(getBack), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
}
