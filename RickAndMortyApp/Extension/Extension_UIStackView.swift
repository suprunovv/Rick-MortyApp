//
//  Extension_UIStackView.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(view: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spasing: CGFloat,
                     alignment: Alignment) {
        self.init(arrangedSubviews: view)
        self.axis = axis
        self.spacing = spasing
        self.alignment = alignment
        
    }
}
