//
//  MainTabCoordinator.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

class MainTabCoordinator: Coordinator {
    var navigationController: UINavigationController
    weak var appCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBar = UITabBarController()
        
        let exploreVC  = ExploreViewController();  exploreVC.coordinator  = self
        let wishlistVC = WishlistViewController(); wishlistVC.coordinator = self
        let tripsVC    = TriptsViewController();   tripsVC.coordinator    = self
        let inboxVC    = InboxViewController();    inboxVC.coordinator    = self
        let profileVC  = ProfileViewController();  profileVC.coordinator  = self
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.stackedLayoutAppearance.selected.iconColor = AppColor.primary70
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: AppColor.neutral70]
        tabBar.tabBar.standardAppearance = appearance
        tabBar.tabBar.scrollEdgeAppearance = appearance
        tabBar.tabBar.unselectedItemTintColor = .secondaryLabel
        
        let specs: [(vc: UIViewController, title: String, icon: AppIcon, badge: String?)] = [
            (exploreVC,  "Explore",  .OutlineSearch, nil),
            (wishlistVC, "Wishlist", .OutlineHeart,  "3"),
            (tripsVC,    "Trips",    .OutlineAirbnb, nil),
            (inboxVC,    "Inbox",    .OutlineMessage, "7"),
            (profileVC,  "Profile",  .OutlineUser,   nil)
        ]
        
        let controllers: [UINavigationController] = specs.enumerated().map { (idx, s) in
            let nav = UINavigationController(rootViewController: s.vc)
            hideTopNavBar(nav)
         
            let item = UITabBarItem(
                title: s.title,
                image: s.icon.image?.withRenderingMode(.alwaysTemplate),
                selectedImage: s.icon.image?.withRenderingMode(.alwaysTemplate)
            )
            item.tag = idx
            item.badgeValue = s.badge
            item.badgeColor = AppColor.primary70
            nav.tabBarItem = item
            return nav
        }
        
      
        
        tabBar.viewControllers = controllers
        navigationController.setViewControllers([tabBar], animated: true)
    }

    @objc func logoutTapped() {
        appCoordinator?.goToOnboarding()
    }
}


private func hideTopNavBar(_ nav: UINavigationController) {
    nav.isNavigationBarHidden = true
    nav.setNavigationBarHidden(true, animated: false)
    nav.hidesBarsOnSwipe = false
    nav.navigationItem.largeTitleDisplayMode = .never
}
