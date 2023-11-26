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
    var arrayLike = [PersonModel]() {
        didSet {
            startView.favouritCollectionView.reloadData()
        }
    }
    
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    private func setView() {
        startView.favouritCollectionView.dataSource = self
        startView.favouritCollectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.reuseID)
    }
    
}


