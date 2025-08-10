//
//  AppColor.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit



//MARK: Primary
enum AppColor {
    static var primary10: UIColor { appColor("Primary10") }
    static var primary20: UIColor { appColor("Primary20") }
    static var primary30: UIColor { appColor("Primary30") }
    static var primary40: UIColor { appColor("Primary40") }
    static var primary50: UIColor { appColor("Primary50") }
    static var primary60: UIColor { appColor("Primary60") }
    static var primary70: UIColor { appColor("Primary70") }
    static var primary80: UIColor { appColor("Primary80") }
    static var primary90: UIColor { appColor("Primary90") }
}

//MARK: neutral
extension AppColor {
    static var neutral10: UIColor { appColor("Neutral10") }
    static var neutral20: UIColor { appColor("Neutral20") }
    static var neutral30: UIColor { appColor("Neutral30") }
    static var neutral40: UIColor { appColor("Neutral40") }
    static var neutral50: UIColor { appColor("Neutral50") }
    static var neutral60: UIColor { appColor("Neutral60") }
    static var neutral70: UIColor { appColor("Neutral70") }
    static var neutral80: UIColor { appColor("Neutral80") }
    static var neutral90: UIColor { appColor("Neutral90") }
}

//MARK: Helper
private func appColor(_ name: String) -> UIColor {
    guard let c = UIColor(named: name) else {
        assertionFailure("Missing color asset: \(name)")
        return .systemPink
    }
    return c
}
