//
//  Extension_EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 21.11.2023.
//

import Foundation
import UIKit

extension EpisodesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        LikedEpisodes.shared.selfEpisodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCollectionViewCell.reuseID, for: indexPath) as? EpisodesCollectionViewCell else { return UICollectionViewCell() }
        cell.setCell(LikedEpisodes.shared.selfEpisodes[indexPath.row], delegate: self, transferDelegate: self, reloadDelegate: nil)
        return cell
    }
    
}

extension EpisodesViewController: ColletionCellDelegate {
    func peredacha(model: PersonModel) {
        let secVc = CharacterDetailsViewController(model: model)
        navigationController?.pushViewController(secVc, animated: true)
    }
}

extension EpisodesViewController: TransferCell {
    func transfer(model: PersonModel) {
        LikedEpisodes.shared.updateLikeEpisode(episode: model)
    }
}
