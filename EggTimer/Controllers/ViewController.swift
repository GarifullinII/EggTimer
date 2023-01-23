//
//  ViewController.swift
//  EggTimer
//
//  Created by Ildar Garifullin on 23/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let eggLabel: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = label.font.withSize(28)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let eggOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "soft_egg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let eggTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "medium_egg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let eggThreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hard_egg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var eggStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.5203130841, green: 0.8027799726, blue: 0.8295106292, alpha: 1)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(eggLabel)
        
        eggStackView = UIStackView(
            arrangedSubviews: [eggOneImageView, eggTwoImageView, eggThreeImageView],
            axis: .horizontal,
            spacing: 10,
            distribution: .fillEqually
        )
        
        view.addSubview(eggStackView)
    }
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            eggLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            eggLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            eggLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            eggStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eggStackView.topAnchor.constraint(equalTo: eggLabel.bottomAnchor, constant: 200),
            eggStackView.widthAnchor.constraint(equalToConstant: 380),
            eggStackView.heightAnchor.constraint(equalToConstant: 150)
            //            eggStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //            eggStackView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
        ])
    }
}

