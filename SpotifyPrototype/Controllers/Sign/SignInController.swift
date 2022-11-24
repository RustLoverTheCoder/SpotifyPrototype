//
//  SignInController.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

class SignInController: BaseController {
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.logo
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.Text.SignIn.signIn
        label.textColor = R.Colors.white
        label.font = R.Fonts.bold(with: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.Colors.white.withAlphaComponent(0.1)
        button.setImage(R.Icons.back, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(getBack), for: .touchUpInside)
        return button
    }()
    
    let username = BaseTextField()
    let password = BaseTextField()
    
    private let recoveryButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.Text.SignIn.recovery, for: .normal)
        button.titleLabel?.font = R.Fonts.bold(with: 14)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(R.Colors.white, for: .normal)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.Text.SignIn.signIn, for: .normal)
        button.titleLabel?.textColor = R.Colors.white
        button.titleLabel?.font = R.Fonts.bold(with: 20)
        button.backgroundColor = R.Colors.salt
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    private let googleLogo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.google
        return image
    }()
    private let appleLogo: UIImageView = {
        let image = UIImageView()
        image.image = R.Icons.apple
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
        label.text = R.Text.SignIn.notAMember
        label.textColor = R.Colors.white
        label.font = R.Fonts.bold(with: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.Text.SignIn.register, for: .normal)
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
        if username.text == "Amal" && password.text == "123" {
            let app = HomeController()
            app.modalPresentationStyle = .overCurrentContext
            self.present(app, animated: true)
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
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            logo.widthAnchor.constraint(equalToConstant: 145),
            
            titleLabel.bottomAnchor.constraint(equalTo: signInStack.topAnchor, constant: -50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            logoStack.topAnchor.constraint(equalTo: signInStack.bottomAnchor, constant: 40),
            logoStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            registerStack.topAnchor.constraint(equalTo: logoStack.bottomAnchor, constant: 40),
            registerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        
            googleLogo.widthAnchor.constraint(equalToConstant: 35),
            
            appleLogo.widthAnchor.constraint(equalToConstant: 30),
            
            signInStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        navigationItem.titleView = logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        username.placeholder = R.Text.SignIn.username
        password.placeholder = R.Text.SignIn.password
    }
}
