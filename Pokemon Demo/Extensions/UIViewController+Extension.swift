//
//  UIViewController+Extension.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/10/22.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
