//
//  ProfileView.swift
//  SpotifyPrototype
//
//  Created by aiv on 25.11.2022.
//

import UIKit

class ProfileView: BaseView {
    private let avatar: UIImageView = {
        let view = UIImageView()
        view.image = R.Profile.Images.avatar
        view.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 45
        view.layer.masksToBounds = true
        return view
    }()
    
    private let email: UILabel = {
        let label = UILabel()
        label.text = R.Profile.Texts.email
        label.font = R.Fonts.regular(with: 12)
        label.textColor = R.Colors.white
        return label
    }()
    
    private let username: UILabel = {
        let label = UILabel()
        label.text = R.Profile.Texts.username
        label.font = R.Fonts.bold(with: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    private let numberFollowes: UILabel = {
        let label = UILabel()
        label.text = "778"
        label.font = R.Fonts.bold(with: 22)
        label.textColor = UIColor.white
        return label
    }()
    
    private let followes: UILabel = {
        let label = UILabel()
        label.text = R.Profile.Texts.followes
        label.font = R.Fonts.regular(with: 14)
        label.textColor = R.Colors.white
        return label
    }()
    
    private let followesStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    private let numberFollowers: UILabel = {
        let label = UILabel()
        label.text = "269"
        label.font = R.Fonts.bold(with: 22)
        label.textColor = UIColor.white
        return label
    }()
    
    private let followers: UILabel = {
        let label = UILabel()
        label.text = R.Profile.Texts.followers
        label.font = R.Fonts.regular(with: 14)
        label.textColor = R.Colors.white
        return label
    }()
    
    private let followersStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    private let subStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 50
        stack.axis = .horizontal
        return stack
    }()

}

extension ProfileView {
    override func setupViews() {
        followesStack.addArrangedSubview(numberFollowes)
        followesStack.addArrangedSubview(followes)
        
        followersStack.addArrangedSubview(numberFollowers)
        followersStack.addArrangedSubview(followers)
        
        subStack.addArrangedSubview(followesStack)
        subStack.addArrangedSubview(followersStack)
        
        setupView(avatar)
        setupView(email)
        setupView(username)
        setupView(subStack)
    }
    
    override func constraintViews() {
        NSLayoutConstraint.activate([
            avatar.heightAnchor.constraint(equalToConstant: 90),
            avatar.widthAnchor.constraint(equalToConstant: 90),
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            avatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            email.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10),
            email.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            username.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            username.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            subStack.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            subStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            subStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        
        ])
    }
    
    override func configureApperance() {
        backgroundColor = R.Colors.secondary
    }
}
