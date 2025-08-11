//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

final class ExploreView: UIView {
    private let stack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 12
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let icon = CategoryIcon(isActive: true,  title: "Water", icon: AppIcon.OutlineHotWater.rawValue)
    let icon2 = CategoryIcon(isActive: true,  title: "Bed", icon: AppIcon.OutlineBed.rawValue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureButtons()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup
private extension ExploreView {
    func configureButtons() {
      
    }
    
    func layout() {
        addSubview(stack)
        
        [icon,icon2]
            .forEach { stack.addArrangedSubview($0) }
        
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 24, leading: 20, bottom: 24, trailing: 20)
        preservesSuperviewLayoutMargins = true
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
}
