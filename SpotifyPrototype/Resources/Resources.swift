//
//  Resources.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

enum R {
    
    //    MARK: Start Controller
    enum Start {        
        enum Texts {
            static let getStarted = "Get Started"
            static let titleText = "Enjoy Listening To Music"
            static let textInfo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam."
        }
        
        enum Images {
            static let background = UIImage(named: "first")
        }
    }
    
    //    MARK: Choose Controller
    enum Choose {
        enum Icons {
            static let darkMode = UIImage(named: "darkMode")
            static let lightMode = UIImage(named: "sunlightMode")
        }
        
        enum Texts {
            static let continued = "Continue"
            static let darkMode = "Dark Mode"
            static let lightMode = "Light Mode"
            static let chooseMode = "Choose Mode"
        }
        
        enum Images {
            static let background = UIImage(named: "second")
        }
    }
    
    //    MARK: Register or Sign In Controller
    enum RegOrSig {
        enum Texts {
            static let titleText = "Enjoy Listening To Music"
            static let textInfo = "Spotify is a proprietary Swedish audio streaming and media services provider"
            static let register = "Register"
            static let signIn = "Sign In"
        }
        
        enum Images {
            static let background = UIImage(named: "third")
        }
    }
    
    //    MARK: Sign In Controller
    enum SignIn {
        enum Icons {
            static let apple = UIImage(named: "apple")
            static let google = UIImage(named: "google")
        }
    
        enum Texts {
            static let signIn = "Sign In"
            static let username = "Enter Username Or Email"
            static let password = "Password"
            static let recovery = "Recovery Password"
            static let notAMember = "Not A Member?"
            static let register = "Register"
        }
        
        enum Images {
            static let background = UIImage(named: "third")
        }
    }
    
    
    //    MARK: TabBar Controller
    enum TabBar {
        enum Icons {
            static let home = UIImage(named: "home")
            static let discovery = UIImage(named: "discovery")
            static let like = UIImage(named: "like")
            static let profile = UIImage(named: "profile")
        }
    }
    
//    MARK: Home
    enum Home {
        enum Icons {
            static let apple = UIImage(named: "apple")
            static let google = UIImage(named: "google")
        }
    
        enum Texts {
            static let signIn = "Sign In"
            static let username = "Enter Username Or Email"
            static let password = "Password"
            static let recovery = "Recovery Password"
            static let notAMember = "Not A Member?"
            static let register = "Register"
        }
        
        enum Images {
            static let artist = UIImage(named: "artist")
        }
    }
    
//    MARK: Profile
    enum Profile {
        enum Texts {
            static let profile = "Profile"
            static let email = "email@email.com"
            static let username = "aiv"
            static let followes = "Followes"
            static let followers = "Followers"
            static let songTitle = "Song Title"
            static let artist = "Artist"
            
        }
        enum Images {
            static let avatar = UIImage(named: "avatar")
        }
    }
    
    //    MARK: Icons
    enum Icons {
        static let spotifyLogo = UIImage(named: "spotifyLogo")
        static let back = UIImage(named: "back")
        static let threeDot = UIImage(named: "threeDot")
        static let threeDotHor = UIImage(named: "threeDotHor")
        static let play = UIImage(named: "play")
        static let search = UIImage(named: "search")
    }
    
//    MARK: Colors
    enum Colors {
        static let background = UIColor(hexString: "#1C1B1B")
        static let salt = UIColor(hexString: "#42C83C")
        static let white = UIColor(hexString: "#DADADA")
        static let grey = UIColor(hexString: "#797979")
        static let secondary = UIColor(hexString: "#343434")
    }
    
//    MARK: Fonts
    enum Fonts {
        static func regular(with size: CGFloat) -> UIFont {
            UIFont(name: "Satoshi-Regular", size: size) ?? UIFont()
        }
        static func bold(with size: CGFloat) -> UIFont {
            UIFont(name: "Satoshi-Bold", size: size) ?? UIFont()
        }
    }
}
