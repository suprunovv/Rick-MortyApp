//
//  LoadView.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 19.11.2023.
//

import UIKit

final class LoadView: UIView {
    
    private let titleImageView = UIImageView()
    let imageViewPortal = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        backgroundColor = .white
        addSubview(titleImageView)
        addSubview(imageViewPortal)
        imageViewPortal.image = UIImage(named: "loadingLogo")
        titleImageView.image = UIImage(named: "Logo")
        setConstraint()
    }
    
    private func setConstraint() {
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34),
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleImageView.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        imageViewPortal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageViewPortal.heightAnchor.constraint(equalToConstant: 200),
            imageViewPortal.widthAnchor.constraint(equalToConstant: 200),
            imageViewPortal.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewPortal.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
}
