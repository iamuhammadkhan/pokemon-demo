//
//  UIView+Extension.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import UIKit

extension UIView {
    func applyBorder(_ width: CGFloat = 1, color: UIColor = AppConstants.Colors.appLightGreyBorder) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func makeCircularView() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
    }
}
