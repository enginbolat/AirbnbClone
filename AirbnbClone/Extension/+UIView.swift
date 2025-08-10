//
//  +UIView.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

extension UIView {
    func addSubViews(_ view: UIView...) {
        view.forEach { self.addSubview($0) }
    }
}
