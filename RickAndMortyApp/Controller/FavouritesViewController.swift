//
//  favouritesViewController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import UIKit

protocol ReloadCollection: AnyObject {
    func reloadCollection()
}

final class FavouritesViewController: UIViewController {

    let startView = FavouritesView()

    override func loadView() {
        view = startView
        navigationController?.navigationBar.isHidden = true 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startView.favouritCollectionView.reloadData()
    }
    
    private func setView() {
        startView.favouritCollectionView.dataSource = self
        startView.favouritCollectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.reuseID)
    }
    
}


