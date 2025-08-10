//
//  InboxViewController.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

final class InboxViewController: UIViewController {
    weak var coordinator: MainTabCoordinator?
    let body = InboxView()
    
    override func viewDidLoad() {
        layout()
    }
}


extension InboxViewController {
    private func layout() {
        body.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(body)
        
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: view.topAnchor),
            body.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            body.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            body.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
