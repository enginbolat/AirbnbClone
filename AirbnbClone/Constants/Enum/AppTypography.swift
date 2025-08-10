//
//  AppTypography.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

enum AppTypography {
    
    struct Heading {
        static let h1 = TextStyle(
            font: AppFont.airbnbCereal(48, weight: .medium),
            letterSpacing: 0.8,
            lineHeight: 62
        )
        static let h2 = TextStyle(
            font: AppFont.airbnbCereal(32, weight: .medium),
            letterSpacing: 0.6,
            lineHeight: 38
        )
        static let h3 = TextStyle(
            font: AppFont.airbnbCereal(24, weight: .medium),
            letterSpacing: 0.4,
            lineHeight: 28
        )
        static let h4 = TextStyle(
            font: AppFont.airbnbCereal(20, weight: .medium),
            letterSpacing: 0.4,
            lineHeight: 26
        )
        static let h5 = TextStyle(
            font: AppFont.airbnbCereal(18, weight: .medium),
            letterSpacing: 0.4,
            lineHeight: 24
        )
    }
    
    struct Body {
        static let largeBold = TextStyle(
            font: AppFont.airbnbCereal(16, weight: .bold),
            letterSpacing: 0.4,
            lineHeight: 24
        )
        static let largeRegular = TextStyle(
            font: AppFont.airbnbCereal(16, weight: .regular),
            letterSpacing: 0.4,
            lineHeight: 24
        )
        static let normalBold = TextStyle(
            font: AppFont.airbnbCereal(14, weight: .bold),
            letterSpacing: 0.4,
            lineHeight: 20
        )
        static let normalRegular = TextStyle(
            font: AppFont.airbnbCereal(14, weight: .regular),
            letterSpacing: 0.4,
            lineHeight: 20
        )
        static let smallRegular = TextStyle(
            font: AppFont.airbnbCereal(12, weight: .regular),
            letterSpacing: 0.4,
            lineHeight: 16
        )
    }
}

struct TextStyle {
    let font: UIFont
    let letterSpacing: CGFloat
    let lineHeight: CGFloat
}
