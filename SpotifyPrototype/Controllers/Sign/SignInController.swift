//
//  SignInController.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

class SignInController: BaseController {
    private let signInButton = ContinueButton(title: R.SignIn.Texts.signIn, type: .salt)
    private let backButton = BackButton()
    private let username = BaseTextField()
    private let password = BaseTextField()
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.spotifyLogo
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.SignIn.Texts.signIn
        label.textColor = R.Colors.white
        label.font = R.Fonts.bold(with: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let recoveryButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.SignIn.Texts.recovery, for: .normal)
        button.titleLabel?.font = R.Fonts.bold(with: 14)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(R.Colors.white, for: .normal)
        return button
    }()
    
    private let googleLogo: UIImageView = {
        let image = UIImageView()
        image.image = R.SignIn.Icons.google
        return image
    }()
    private let appleLogo: UIImageView = {
        let image = UIImageView()
        image.image = R.SignIn.Icons.apple
        return image
    }()
    
    private let logoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 60
        return stackView
    }()
    
    private let register: UILabel = {
        let label = UILabel()
        label.text = R.SignIn.Texts.notAMember
        label.textColor = R.Colors.white
        label.font = R.Fonts.bold(with: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.SignIn.Texts.register, for: .normal)
        button.titleLabel?.font = R.Fonts.bold(with: 14)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(R.Colors.salt, for: .normal)
        return button
    }()
    
    private let registerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    private let signInStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    @objc func getBack() {
        self.dismiss(animated: true)
    }
    
    @objc func signIn() {
        
        if username.text == "aiv" && password.text == "123" {
            let tabBar = TabBarController()
            tabBar.modalPresentationStyle = .overCurrentContext
            self.present(tabBar, animated: true)
        } else {
            alertController()
        }
    }
    
    func alertController() {
        let alert = UIAlertController(title: "Ошибка", message: "Данного пользователя не существует", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension SignInController {
    override func setupViews() {
        super.setupViews()
        signInStack.addArrangedSubview(username)
        signInStack.addArrangedSubview(password)
        signInStack.addArrangedSubview(recoveryButton)
        signInStack.addArrangedSubview(signInButton)
        
        logoStack.addArrangedSubview(googleLogo)
        logoStack.addArrangedSubview(appleLogo)
        registerStack.addArrangedSubview(register)
        registerStack.addArrangedSubview(registerButton)
        
        view.setupView(signInStack)
        view.setupView(titleLabel)
        view.setupView(logoStack)
        view.setupView(registerStack)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 145),
            
            titleLabel.bottomAnchor.constraint(equalTo: signInStack.topAnchor, constant: -50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            logoStack.topAnchor.constraint(equalTo: signInStack.bottomAnchor, constant: 40),
            logoStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            googleLogo.widthAnchor.constraint(equalToConstant: 35),
            appleLogo.widthAnchor.constraint(equalToConstant: 30),
            
            registerStack.topAnchor.constraint(equalTo: logoStack.bottomAnchor, constant: 40),
            registerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        navigationItem.titleView = logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        username.placeholder = R.SignIn.Texts.username
        password.placeholder = R.SignIn.Texts.password
        password.isSecureTextEntry = true
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(getBack), for: .touchUpInside)
    }
}
