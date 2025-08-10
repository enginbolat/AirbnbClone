//
//  +UILabel.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

extension UILabel {
    func applyStyle(_ style: TextStyle, color: UIColor? = nil) {
        let paragraph = NSMutableParagraphStyle()
        paragraph.minimumLineHeight = style.lineHeight
        paragraph.maximumLineHeight = style.lineHeight
        
        let attrs: [NSAttributedString.Key: Any] = [
            .font: style.font,
            .kern: style.letterSpacing,
            .paragraphStyle: paragraph,
            .foregroundColor: color ?? self.textColor ?? .label
        ]
        attributedText = NSAttributedString(string: text ?? "", attributes: attrs)
    }
}
