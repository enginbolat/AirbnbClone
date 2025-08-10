//
//  +UILabel.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

extension UILabel {
    func applyStyle(_ style: TextStyle) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = style.lineHeight
        paragraphStyle.maximumLineHeight = style.lineHeight
        
        attributedText = NSAttributedString(
            string: text ?? "",
            attributes: [
                .font: style.font,
                .kern: style.letterSpacing,
                .paragraphStyle: paragraphStyle
            ]
        )
    }
}
