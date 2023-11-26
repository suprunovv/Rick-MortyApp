//
//  EpisodesView.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import UIKit

final class EpisodesView: UIView {
    
    private let logoImageView = UIImageView()
    let seartchBar = UITextField()
    private let filterButton = UIButton(type: .system)
    private let mainScrollView = UIScrollView()
    
    let searchButton = UIButton(type: .system)
    
    lazy var seriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: EpisodesFlowLayout())
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setView()
        setScrollView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setView() {
        logoImageView.contentMode = .scaleToFill
        logoImageView.image = UIImage(named: "Logo")
        
        seartchBar.placeholder = "Name or episode (ex.S01E01)..."
        seartchBar.layer.cornerRadius = 4
        seartchBar.layer.borderWidth = 1
        seartchBar.layer.borderColor = UIColor.gray.cgColor
        
        filterButton.backgroundColor = UIColor(named: "ColorFilterButton")
        filterButton.setTitle("ADVANCED FILTERS", for: .normal)
        filterButton.layer.cornerRadius = 4
        
        searchButton.setImage(UIImage(named: "seartch"), for: .normal)
        seartchBar.leftView = searchButton
        seartchBar.leftViewMode = .always
        
    }
    
    private func setScrollView() {
        mainScrollView.contentSize = CGSize(width: mainScrollView.frame.width, height: UIScreen.main.bounds.height + 25)
        mainScrollView.isPagingEnabled = true
        mainScrollView.showsVerticalScrollIndicator = false
    }
    
    
    private func setConstraint() {
        
        addSubview(mainScrollView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainScrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 18),
            mainScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainScrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        mainScrollView.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor),
            logoImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 104)
        
        ])
        
        let stackView = UIStackView(view: [seartchBar, filterButton], axis: .vertical, spasing: 12, alignment: .fill)
        
        mainScrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor),
            stackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 171),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 124),
            filterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        mainScrollView.addSubview(seriesCollectionView)
        seriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        seriesCollectionView.backgroundColor = .clear
        seriesCollectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.reuseID)
        
        NSLayoutConstraint.activate([
            seriesCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            seriesCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            seriesCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            seriesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.heightAnchor.constraint(equalToConstant: 56),
            searchButton.widthAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
    

}
