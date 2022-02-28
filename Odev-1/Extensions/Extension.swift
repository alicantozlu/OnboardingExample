//
//  Extension.swift
//  Odev-1
//
//  Created by Ali Can Tozlu on 11.02.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set { self.layer.cornerRadius = newValue }
    }
}
