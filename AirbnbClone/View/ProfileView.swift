//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

final class ProfileView: UIView {
    let label :UILabel = {
        let label = UILabel()
        label.text = "Profile!"
        label.applyStyle(AppTypography.Heading.h3, color: AppColor.primary50)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout() {
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
