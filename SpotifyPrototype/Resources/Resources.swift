//
//  Resources.swift
//  SpotifyPrototype
//
//  Created by aiv on 22.11.2022.
//

import UIKit

enum R {
    enum Fonts {
        static func regular(with size: CGFloat) -> UIFont {
            UIFont(name: "Satoshi-Regular", size: size) ?? UIFont()
        }
        static func bold(with size: CGFloat) -> UIFont {
            UIFont(name: "Satoshi-Bold", size: size) ?? UIFont()
        }
    }
}
