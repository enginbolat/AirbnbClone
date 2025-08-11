//
//  CategoryIconView.swift
//  AirbnbClone
//
//  Created by Engin Bolat on 11.08.2025.
//

import UIKit

final class CategoryIcon: UIView {
    private(set) var isActive: Bool
    private let title: String
    private let iconName: String

    private let container = UIView()
    private let iconView = UIImageView()
    private let underlineLayer = CALayer()
    private let titleLabel = UILabel()

    init(isActive: Bool, title: String, icon: String) {
        self.isActive = isActive
        self.title = title
        self.iconName = icon
        super.init(frame: .zero)
        setup()
        layout()
        applyState()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func setActive(_ active: Bool) {
        guard active != isActive else { return }
        isActive = active
        applyState()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 47).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true

        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear

        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.applyStyle(AppTypography.Body.smallRegular)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.layer.addSublayer(underlineLayer)


        container.addSubview(iconView)
        addSubview(container)
        addSubview(titleLabel)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor),
            container.heightAnchor.constraint(equalToConstant: 32),

            iconView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 28),
            iconView.heightAnchor.constraint(equalToConstant: 28),

            titleLabel.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 4),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let underlineWidth: CGFloat = 12
        let underlineHeight: CGFloat = 4
        underlineLayer.frame = CGRect(
            x: (titleLabel.bounds.width - underlineWidth) / 2,
            y: titleLabel.bounds.height + underlineHeight,
            width: underlineWidth,
            height: underlineHeight
        )
    }

    private func applyState() {
        if isActive {
            iconView.tintColor = AppColor.neutral100
            titleLabel.textColor = AppColor.neutral100
            titleLabel.applyStyle(AppTypography.Body.normalBold)
            underlineLayer.backgroundColor = AppColor.neutral100.cgColor
        } else {
            iconView.tintColor = AppColor.neutral70
            titleLabel.textColor = AppColor.neutral70
            titleLabel.applyStyle(AppTypography.Body.smallRegular)
            underlineLayer.backgroundColor = UIColor.clear.cgColor
        }
    }
}
