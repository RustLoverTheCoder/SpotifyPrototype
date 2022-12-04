//
//  TabBarController.swift
//  SpotifyPrototype
//
//  Created by aiv on 24.11.2022.
//

import UIKit

enum Tabs: Int {
    case home
    case discovery
    case like
    case profile
}

final class TabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureApperance() {
        tabBar.backgroundColor = R.Colors.secondary
        tabBar.tintColor = R.Colors.salt
        
        
        let homeController = HomeController()
        let discoveryController = DiscoverController()
        let likeController = LikeController()
        let profileController = ProfileController()
        
        let homeNavigation = NavBarController(rootViewController: homeController)
        let discoveryNavigation = NavBarController(rootViewController: discoveryController)
        let likeNavigation = NavBarController(rootViewController: likeController)
        let profileNavigation = NavBarController(rootViewController: profileController)
        
        homeNavigation.tabBarItem = UITabBarItem(title: nil,
                                                 image: R.TabBar.Icons.home,
                                                 tag: Tabs.home.rawValue)
        discoveryNavigation.tabBarItem = UITabBarItem(title: nil,
                                                      image: R.TabBar.Icons.discovery,
                                                      tag: Tabs.discovery.rawValue)
        likeNavigation.tabBarItem = UITabBarItem(title: nil,
                                                 image: R.TabBar.Icons.like,
                                                 tag: Tabs.like.rawValue)
        profileNavigation.tabBarItem = UITabBarItem(title: nil,
                                                    image: R.TabBar.Icons.profile,
                                                    tag: Tabs.profile.rawValue)
        
        setViewControllers([
            homeNavigation,
            discoveryNavigation,
            likeNavigation,
            profileNavigation
        ], animated: false)
    }
}
