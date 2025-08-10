//
//  AppFont.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

enum AppFont {
    static func airbnbCereal(_ size: CGFloat, weight: FontWeight) -> UIFont {
        let name: String
        switch weight {
        case .regular: name = "AirbnbCerealApp-Book"
        case .light: name = "AirbnbCerealApp-Light"
        case .bold: name = "AirbnbCerealApp-Bold"
        default: name = "AirbnbCerealApp-Medium"
        }
        
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    enum FontWeight {
        case light
        case regular
        case medium
        case bold
    }
}
