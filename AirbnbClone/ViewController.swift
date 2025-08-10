//
//  ViewController.swift
//  AirbnbClone
//
//  Created by Engin on 10.08.2025.
//

import UIKit

class ViewController: UIViewController {
    let labelh5 :UILabel = {
        let label = UILabel()
        label.text = "Hello, Airbnb Clone!"
        label.applyStyle(AppTypography.Heading.h5)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelh4 :UILabel = {
        let label = UILabel()
        label.text = "Hello, Airbnb Clone!"
        label.applyStyle(AppTypography.Heading.h4)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelh3 :UILabel = {
        let label = UILabel()
        label.text = "Hello, Airbnb Clone!"
        label.applyStyle(AppTypography.Heading.h3)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelh2 :UILabel = {
        let label = UILabel()
        label.text = "Hello, Airbnb Clone!"
        label.applyStyle(AppTypography.Heading.h2)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelh1 :UILabel = {
        let label = UILabel()
        label.text = "Hello, Airbnb Clone!"
        label.applyStyle(AppTypography.Heading.h1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        view.addSubViews(labelh1,labelh2,labelh3,labelh4,labelh5)
        
        NSLayoutConstraint.activate([
            labelh5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelh5.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            labelh4.centerYAnchor.constraint(equalTo: labelh5.bottomAnchor, constant: 12),
            labelh4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelh3.centerYAnchor.constraint(equalTo: labelh4.bottomAnchor, constant: 12),
            labelh3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelh2.centerYAnchor.constraint(equalTo: labelh3.bottomAnchor, constant: 12),
            labelh2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelh1.centerYAnchor.constraint(equalTo: labelh2.bottomAnchor, constant: 12),
            labelh1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

