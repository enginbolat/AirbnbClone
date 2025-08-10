//
//  AppIcon.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import Foundation
import UIKit

/// TODO:
/// Bazı ikonların arka planları beyaz kalmış durumda onları düzeltmek gerekli.

enum AppIcon: String, CaseIterable {
    case OutlineCar
    case OutlineLock
    case OutlineLocation
    case OutlineSearch
    case OutlineMessage
    case OutlineUser
    case OutlineBlock
    case OutlineHeart
    case OutlineBriefcase
    case OutlineMenu
    case OutlineCalendar
    case OutlineCalendar2
    case OutlineClose
    case OutlinePlus
    case OutlineMinus
    case OutlineChevronLeft
    case OutlineChevronRight
    case OutlineArrowLeft
    case OutlineArrowRight
    case OutlineBell
    case OutlineFilter
    case OutlineTranslate
    case OutlineBed
    case OutlineDoor
    case OutlineDoorLock
    case OutlineDownload
    case OutlineMoney
    case OutlineView
    case OutlineView2
    case OutlineView3
    case OutlineKitchen
    case OutlineHairDryer
    case OutlineShampoo
    case OutlineHotWater
    case OutlineShowerGel
    case OutlineWasher
    case OutlineNoStairs
    case OutlineKey
    case OutlineNoKitchen
    case OutlineNoAC
    case OutlineNoMonoxide
    case OutlineNoEntrance
    case OutlineCCTV
    case OutlineMonixide
    case OutlineWifi
    case OutlineBeach
    case OutlineBeach2
    case OutlineUFO
    case OutlinePool
    case OutlineIsland
    case OutlineArctic
    case OutlineCabin
    case OutlineRoom
    case OutlineWorkspace
    case OutlineCaves
    case OutlineAirbnb
    
    //MARK: Filled
    case FilledVerification
    case FilledFlag
    case FilledAdd
    case FilledHome
    case FilledMaps
    case FilledStar
    
    //MARK: TwoTone
    case TwoToneEarnMoney
    case TwoToneAirbnbProject
}

extension AppIcon {
    var image: UIImage? {
        let name = String(describing: self)
        if let img = UIImage(named: name) { return img }
        print("⚠️ Missing icon asset: \(name)")
        assertionFailure("Missing icon asset: \(name)")
        return nil
    }
}
