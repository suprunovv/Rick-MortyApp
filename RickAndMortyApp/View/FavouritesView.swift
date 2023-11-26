//
//  FavouritesView.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import UIKit

final class FavouritesView: UIView {

    
    lazy var favouritCollectionView = UICollectionView(frame: .zero, collectionViewLayout: EpisodesFlowLayout())
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setView() {
        backgroundColor = .white
        titleLabel.text = "Favourites episodes"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 24)
        setConstraint()
    }
    
    private func setConstraint() {
        addSubview(favouritCollectionView)
        favouritCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favouritCollectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            favouritCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            favouritCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            favouritCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            favouritCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: favouritCollectionView.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
