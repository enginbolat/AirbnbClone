//
//  CategoryIconView.swift
//  AirbnbClone
//
//  Created by Engin Bolat on 11.08.2025.
//

import UIKit

import UIKit

final class CategoryIconView: UIView {
    private(set) var isActive: Bool
    private let title: String
    private let iconName: String

    // UI
    private let container = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()

    // MARK: Init
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

    // MARK: Public
    func setActive(_ active: Bool) {
        guard active != isActive else { return }
        isActive = active
        applyState()
    }

    // MARK: Setup
    private func setup() {
        // container: yuvarlak/outline arka plan
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 18
        container.layer.borderWidth = 1
        container.layer.masksToBounds = true
        container.backgroundColor = .clear

        // icon
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.image = UIImage(named: iconName)
        iconView.setContentHuggingPriority(.required, for: .vertical)
        iconView.setContentHuggingPriority(.required, for: .horizontal)

        // title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        // kendi tipografinden birini kullan:
        // titleLabel.applyStyle(AppTypography.Body.small, color: AppColor.neutral100)
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1

        addSubview(container)
        container.addSubview(iconView)
        addSubview(titleLabel)
    }

    // MARK: Layout
    private func layout() {
        // Dikey dizilim: [container(icon)] üstte, [title] altta
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.widthAnchor.constraint(equalToConstant: 56),
            container.heightAnchor.constraint(equalToConstant: 56),

            iconView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 28),
            iconView.heightAnchor.constraint(equalToConstant: 28),

            titleLabel.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: Style
    private func applyState() {
        if isActive {
            // aktif: dolgu + açık renk ikon/yazı
            container.backgroundColor = AppColor.primary60
            container.layer.borderColor = AppColor.primary60.cgColor
            iconView.tintColor = AppColor.neutral10
            titleLabel.textColor = AppColor.primary60
            // Eğer ikon PNG ve renklenmiyorsa asset’i template yap veya burada renderingMode ayarla:
            iconView.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)
        } else {
            // pasif: şeffaf arka plan + gri border + koyu yazı
            container.backgroundColor = .clear
            container.layer.borderColor = AppColor.neutral40.cgColor
            iconView.tintColor = AppColor.neutral80
            titleLabel.textColor = AppColor.neutral100
            iconView.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)
        }
    }
}
