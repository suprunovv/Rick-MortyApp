//
//  HeaderDetailsTabel.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 18.11.2023.
//

import UIKit

final class HeaderDetailsTabel: UIView {

    let titleLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        titleLabel.text = "Informations"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .gray
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
    }
    
}
