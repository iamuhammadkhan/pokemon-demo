//
//  UIFont+Extension.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import UIKit

extension UIFont {
    class func applyCommonAppFonts(_ size: CGFloat, _ style: FontStyle = .regular) -> UIFont {
        return UIFont(name: "Helvetica-\(style.rawValue.capitalized)", size: size) ?? .systemFont(ofSize: size)
    }

    enum FontStyle: String {
        case bold, regular, light
    }
}
