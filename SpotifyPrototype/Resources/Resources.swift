//
//  Resources.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

enum R {
    enum Icons {
        static let logo = UIImage(named: "spotifyLogo")
        static let back = UIImage(named: "back")
    }
    
    enum Colors {
        static let salt = UIColor(hexString: "#42C83C")
        static let white = UIColor(hexString: "#DADADA")
        static let black = UIColor(hexString: "#1C1B1B")
        static let grey = UIColor(hexString: "#797979")
    }
    
    enum BackgroundImage {
        static let first = UIImage(named: "first")
        static let second = UIImage(named: "second")
        static let third = UIImage(named: "third")
    }
    
    enum Images {
        enum Present {
            static let darkMode = UIImage(named: "darkMode")
            static let lightMode = UIImage(named: "lightMode")
        }
    }
    
    enum Text {
        enum GetStarted {
            static let getStarted = "Get Started"
            static let titleText = "Enjoy Listening To Music"
            static let textInfo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam."
        }
        enum Choose {
            static let continued = "Continue"
            static let darkMode = "Dark Mode"
            static let lightMode = "Light Mode"
            static let chooseMode = "Choose Mode"
        }
        
        enum SignOrReg {
            static let titleText = "Enjoy Listening To Music"
            static let textInfo = "Spotify is a proprietary Swedish audio streaming and media services provider"
            static let register = "Register"
            static let signIn = "Sign In"
        }
    }
    
    enum Fonts {
        static func regular(with size: CGFloat) -> UIFont {
            UIFont(name: "Satoshi-Regular", size: size) ?? UIFont()
        }
        static func bold(with size: CGFloat) -> UIFont {
            UIFont(name: "Satoshi-Bold", size: size) ?? UIFont()
        }
    }
}
