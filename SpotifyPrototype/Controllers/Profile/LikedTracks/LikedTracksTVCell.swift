//
//  LikedTracksTVCell.swift
//  SpotifyPrototype
//
//  Created by aiv on 25.11.2022.
//

import UIKit

class LikedTracksTVCell: UITableViewCell {
    private let coverImageBack: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separator
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private let coverImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "music.note")
        image.tintColor = R.Colors.white
        return image
    }()
    
    private let songTitle: UILabel = {
        let label = UILabel()
        label.text = R.Profile.Texts.songTitle
        label.font = R.Fonts.bold(with: 16)
        label.textColor = UIColor.white
        return label
    }()
    
    private let artist: UILabel = {
        let label = UILabel()
        label.text = R.Profile.Texts.artist
        label.font = R.Fonts.regular(with: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    private let songTime: UILabel = {
        let label = UILabel()
        label.text = "3:45"
        label.font = R.Fonts.regular(with: 16)
        label.textColor = UIColor.white
        return label
    }()
    
    private let settings: UIButton = {
        let button = UIButton()
        button.setImage(R.Icons.threeDotHor , for: .normal)
        return button
    }()
    
    private let timeAndSettingsStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.spacing = 30
        stack.axis = .horizontal
        return stack
    }()
    
    private let songStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension LikedTracksTVCell {
    func setupViews() {
        songStack.addArrangedSubview(songTitle)
        songStack.addArrangedSubview(artist)
        
        timeAndSettingsStack.addArrangedSubview(songTime)
        timeAndSettingsStack.addArrangedSubview(settings)
        
        setupView(coverImageBack)
        setupView(coverImage)
        setupView(songStack)
        setupView(timeAndSettingsStack)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            coverImageBack.centerYAnchor.constraint(equalTo: centerYAnchor),
            coverImageBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            coverImageBack.heightAnchor.constraint(equalToConstant: 45),
            coverImageBack.widthAnchor.constraint(equalToConstant: 45),
            
            coverImage.centerYAnchor.constraint(equalTo: coverImageBack.centerYAnchor),
            coverImage.centerXAnchor.constraint(equalTo: coverImageBack.centerXAnchor),
            
            songStack.leadingAnchor.constraint(equalTo: coverImageBack.trailingAnchor, constant: 10),
            songStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            timeAndSettingsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            timeAndSettingsStack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    func configureApperance() {
        backgroundColor = R.Colors.background
    }
}

