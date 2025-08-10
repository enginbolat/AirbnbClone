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

extension UIView {
    
    enum AppShadow {
        case shadow1
        case shadow2
        case shadow3
    }
    
    func applyShadow(_ style: AppShadow) {
        layer.masksToBounds = false
        
        switch style {
        case .shadow1:
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.12
            layer.shadowOffset = CGSize(width: 0, height: 1)
            layer.shadowRadius = 2
            
        case .shadow2:
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.10
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 8
            
        case .shadow3:
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.08
            layer.shadowOffset = CGSize(width: 1, height: 2)
            layer.shadowRadius = 2
        }
    }
}
