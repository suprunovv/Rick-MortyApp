//
//  MainTabBarController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let episodesNavigationController = UINavigationController(rootViewController: EpisodesViewController())
    private let favouritesNavigationController = UINavigationController(rootViewController: FavouritesViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        
        navigationItem.hidesBackButton = true
        episodesNavigationController.tabBarItem = UITabBarItem(title: nil,
                                                               image: UIImage(named: "home"),
                                                               selectedImage: UIImage(named: "homeColor"))
        favouritesNavigationController.tabBarItem = UITabBarItem(title: nil,
                                                                 image: UIImage(named: "heart"),
                                                                 selectedImage: UIImage(named: "Vector"))
        
        tabBar.isHidden = false
        tabBar.barTintColor = .white
        setViewControllers([episodesNavigationController, favouritesNavigationController], animated: true)
    }

}
