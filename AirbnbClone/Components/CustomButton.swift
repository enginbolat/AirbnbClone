//
//  CustomButton.swift
//  AirbnbClone
//
//  Created by Engin Bolat on 11.08.2025.
//

import UIKit


enum ButtonSize { case large, medium, small }
enum CustomButtonType { case primary, secondary, secondaryGray, secondaryDark, plainText, link }
enum Style { case normal, hover, focused, pressed, disabled }

final class AppOutlinedButton: UIButton {

    var size: ButtonSize        = .medium { didSet { apply() } }
    var kind: CustomButtonType  = .primary { didSet { apply() } }
    var style: Style            = .normal { didSet { apply() } }

    enum IconPlacement { case leading, trailing, only }
    var iconPlacement: IconPlacement = .leading { didSet { setNeedsLayout() } }
    var spacing: CGFloat = 8 { didSet { setNeedsLayout() } }

    private var height: CGFloat {
        switch size {
        case .large:  return 52
        case .medium: return 42
        case .small:  return 32
        }
    }
    private var cornerRadius: CGFloat {
        switch size {
        case .large:  return 12
        case .medium: return 10
        case .small:  return 8
        }
    }
    private var hPadding: CGFloat {
        switch size {
        case .large:  return 20
        case .medium: return 16
        case .small:  return 12
        }
    }
    private var borderWidth: CGFloat { return (style == .pressed) ? 2 : 1 }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        adjustsImageWhenHighlighted = false
        contentHorizontalAlignment = .center
        layer.masksToBounds = true
        isAccessibilityElement = true
        accessibilityTraits.insert(.button)

        heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true

        if #available(iOS 13.4, *) {
            let hover = UIHoverGestureRecognizer(target: self, action: #selector(handleHover(_:)))
            addGestureRecognizer(hover)
        }

        apply()
        updateStyleFromStates()
    }

    // MARK: - State mapping
    private var isHovering = false { didSet { updateStyleFromStates() } }

    override var isEnabled: Bool { didSet { updateStyleFromStates() } }
    override var isHighlighted: Bool { didSet { updateStyleFromStates() } }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        updateStyleFromStates()
    }
    @available(iOS 13.4, *)
    @objc private func handleHover(_ g: UIHoverGestureRecognizer) {
        switch g.state { case .began, .changed: isHovering = true; default: isHovering = false }
    }
    private func updateStyleFromStates() {
        // if state != .disabled { isEnabled = true }
        if !isEnabled { style = .disabled; return }
        if isHighlighted { style = .pressed; return }
        if isFocused { style = .focused; return }
        if isHovering { style = .hover; return }
        style = .normal
    }

    private func apply() {
        backgroundColor = background(for: kind, state: style)
        setTitleColor(text(for: kind, state: style), for: .normal)
        tintColor = text(for: kind, state: style)

        titleLabel?.font = {
            switch size {
            case .large:  return .systemFont(ofSize: 16, weight: .semibold)
            case .medium: return .systemFont(ofSize: 15, weight: .semibold)
            case .small:  return .systemFont(ofSize: 14, weight: .semibold)
            }
        }()

        if let h = constraints.first(where: { $0.firstAttribute == .height }) {
            h.constant = height
        } else {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        layer.cornerRadius = cornerRadius
        let bColor = border(for: kind, state: style)
        layer.borderWidth = (bColor == nil) ? 0 : borderWidth
        layer.borderColor = bColor?.cgColor ?? UIColor.clear.cgColor


        contentEdgeInsets = UIEdgeInsets(top: 0, left: hPadding, bottom: 0, right: hPadding)

        if kind == .link, let title = title(for: .normal) {
            let attr = NSAttributedString(
                string: title,
                attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                             .foregroundColor: text(for: kind, state: style),
                             .font: titleLabel?.font as Any]
            )
            setAttributedTitle(attr, for: .normal)
        } else {
            if let t = title(for: .normal) {
                setAttributedTitle(nil, for: .normal)
                setTitle(t, for: .normal)
            }
        }

        setNeedsLayout()
    }

    // MARK: - Color tokens

    private func background(for type: CustomButtonType, state: Style) -> UIColor {
        switch type {
        case .primary:
            switch state {
            case .disabled: return AppColor.neutral30
            case .pressed:  return AppColor.primary80
            case .focused:  return AppColor.primary70
            case .hover:    return AppColor.primary70
            case .normal:   return AppColor.primary60
            }
        case .secondary:
            switch state {
            case .pressed: return AppColor.neutral20
            default: return .clear
            }
        default: return .clear
        }
    }

    private func border(for type: CustomButtonType, state: Style) -> UIColor? {
        switch type {
        case .plainText, .link: return nil
        case .primary:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.primary80
            case .focused, .hover: return AppColor.primary70
            case .normal:   return AppColor.primary60
            }
        case .secondary:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.neutral100
            case .focused, .hover: return AppColor.neutral90
            case .normal:   return AppColor.neutral100
            }
        case .secondaryGray:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.neutral70
            case .focused, .hover: return AppColor.neutral60
            case .normal:   return AppColor.neutral50
            }
        case .secondaryDark:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.neutral90
            case .focused, .hover: return AppColor.neutral80
            case .normal:   return AppColor.neutral90
            }
        }
    }

    private func text(for type: CustomButtonType, state: Style) -> UIColor {
        switch type {
        case .link: return .black
        case .plainText:
            switch state {
            case .disabled: return AppColor.neutral30
            case .pressed:  return AppColor.primary80
            case .focused:  return AppColor.primary70
            case .hover:    return AppColor.primary70
            case .normal:   return AppColor.primary60
            }
        case .primary:
            switch state {
            case .disabled: return AppColor.neutral60
            default: return AppColor.neutral10
            }
        case .secondary:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.neutral100
            case .focused, .hover: return AppColor.neutral90
            case .normal:   return AppColor.neutral100
            }
        case .secondaryGray:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.neutral70
            case .focused, .hover: return AppColor.neutral60
            case .normal:   return AppColor.neutral50
            }
        case .secondaryDark:
            switch state {
            case .disabled: return AppColor.neutral40
            case .pressed:  return AppColor.neutral90
            case .focused, .hover: return AppColor.neutral80
            case .normal:   return AppColor.neutral90
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        switch iconPlacement {
        case .leading:
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
        case .trailing:
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2)
        case .only:
            setTitle(nil, for: .normal)
            imageEdgeInsets = .zero
            titleEdgeInsets = .zero
        }
    }
}
