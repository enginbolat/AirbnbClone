//
//  AppCoordinator.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit
import Foundation

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var mainTabCoordinator: MainTabCoordinator?

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        goToMainTab()
    }

    func goToOnboarding() {
        //navigationController.viewControllers.removeAll()

        //onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        //onboardingCoordinator?.appCoordinator = self
        //onboardingCoordinator?.start()
        
        print("Coming Soon...")
    }

    func goToMainTab() {
        mainTabCoordinator = MainTabCoordinator(navigationController: navigationController)
        mainTabCoordinator?.appCoordinator = self
        mainTabCoordinator?.start()
    }
}
