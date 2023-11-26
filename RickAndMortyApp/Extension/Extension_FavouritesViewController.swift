//
//  Extension_FavouritesViewController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 21.11.2023.
//

import Foundation
import UIKit

extension FavouritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        LikedEpisodes.shared.likeEpisodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCollectionViewCell.reuseID, for: indexPath) as? EpisodesCollectionViewCell else {return UICollectionViewCell()}
        cell.setCell(LikedEpisodes.shared.likeEpisodes[indexPath.row], delegate: self, transferDelegate: self, reloadDelegate: self)
        return cell
    }
}

extension FavouritesViewController: ReloadCollection, TransferCell, ColletionCellDelegate {
    func reloadCollection() {
        startView.favouritCollectionView.reloadData()
    }
    func transfer(model: PersonModel) {
        LikedEpisodes.shared.updateLikeEpisode(episode: model)
    }
    func peredacha(model: PersonModel) {
        let secVc = CharacterDetailsViewController(model: model)
        secVc.navigationController?.navigationBar.isHidden = false 
        navigationController?.pushViewController(secVc, animated: true)
    }
}
