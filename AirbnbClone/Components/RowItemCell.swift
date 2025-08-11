//
//  RowItemView.swift
//  AirbnbClone
//
//  Created by Engin Bolat on 11.08.2025.
//

import UIKit

struct RowItemCellModel {
    var icon: String?
    var title: String
    var trailingIcon: String
}

final class RowItemCell: UITableViewCell {
    private var model: RowItemCellModel?
    static var reuseIdentifier = "RowItemCellReuseIdentifier"
    
    var onTap: (() -> Void)?
    
    let stackView = UIStackView()
    let leadingIcon = UIImageView()
    let label = UILabel()
    let trailingIcon = UIImageView()
    
    private var leadingIconWidth: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setup()
        selectionStyle = .gray
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    
    private func setup() {
        if let name = model?.icon,
           let img = UIImage(named: name)?.withRenderingMode(.alwaysTemplate) {
            leadingIcon.image = img
            leadingIcon.tintColor = AppColor.neutral100
            leadingIcon.isHidden = false
            leadingIconWidth.constant = 24
        } else {
            leadingIcon.image = nil
            leadingIcon.isHidden = true
            leadingIconWidth.constant = 0
        }

        label.text = model?.title
        label.applyStyle(AppTypography.Body.largeRegular)
        
        if let name = model?.trailingIcon,
           let img = UIImage(named: name)?.withRenderingMode(.alwaysTemplate) {
            trailingIcon.image = img
            trailingIcon.tintColor = AppColor.neutral100
            leadingIconWidth.constant = 24
        } else {
            leadingIcon.image = nil
            leadingIconWidth.constant = 0
        }
    }
    
    func configure(with model: RowItemCellModel) {
        self.model = model
        setup()
    }
    
    private func layout() {
        leadingIcon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        trailingIcon.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 14
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.addArrangedSubview(leadingIcon)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(trailingIcon)
        
        leadingIconWidth = leadingIcon.widthAnchor.constraint(equalToConstant: 24)
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            leadingIconWidth,
            leadingIcon.heightAnchor.constraint(equalToConstant: 24),
            
            trailingIcon.widthAnchor.constraint(equalToConstant: 16),
            trailingIcon.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func makeTappable() {
        isAccessibilityElement = true
        accessibilityLabel = model?.title
        accessibilityTraits.insert(.button)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
        
        let press = UILongPressGestureRecognizer(target: self, action: #selector(handlePress(_:)))
        press.minimumPressDuration = 0
        addGestureRecognizer(press)
    }

    
    @objc private func handleTap() { onTap?()}

    @objc private func handlePress(_ g: UILongPressGestureRecognizer) {
        switch g.state {
        case .began, .changed: UIView.animate(withDuration: 0.08) { self.alpha = 0.6 }
        default: UIView.animate(withDuration: 0.08) { self.alpha = 1.0 }
        }
    }
}
