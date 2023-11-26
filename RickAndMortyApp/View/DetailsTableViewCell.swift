//
//  DetailsTableViewCell.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 18.11.2023.
//

import UIKit

final class DetailsTableViewCell: UITableViewCell {
    static let reuseId = "DetailsTableViewCell"

    var nameDetailsLabel = UILabel()
    var resultDetailsLabel = UILabel()
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setView()
    }
    private func setView() {
        nameDetailsLabel.font = .boldSystemFont(ofSize: 16)
        resultDetailsLabel.font = .systemFont(ofSize: 14)
        resultDetailsLabel.textColor = .gray
        
        let stack = UIStackView(view: [nameDetailsLabel, resultDetailsLabel], axis: .vertical, spasing: 8, alignment: .leading)
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        
    }

}
