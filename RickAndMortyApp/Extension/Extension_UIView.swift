//
//  Extension_UIView.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 19.11.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func rotate(degrees: CGFloat) {

        let degreesToRadians: (CGFloat) -> CGFloat = { (degrees: CGFloat) in
            return degrees / 180.0 * CGFloat.pi
        }
        self.transform =  CGAffineTransform(rotationAngle: degreesToRadians(degrees))

    }
}
