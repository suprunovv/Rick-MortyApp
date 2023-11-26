//
//  extansion_FlowLayoyt.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 19.11.2023.
//

import Foundation
import UIKit

final class EpisodesFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumInteritemSpacing = 55
        minimumLineSpacing = 55
        let width = UIScreen.main.bounds.width - 48
        itemSize = CGSize(width: width, height: 357)
        sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
