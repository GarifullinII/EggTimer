//
//  ViewController.swift
//  EggTimer
//
//  Created by Ildar Garifullin on 05/06/2024.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Property
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = .robotoMedium24()
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let softEggButton: UIButton = {
        let button = UIButton()
        button.setTitle("SOFT", for: .normal)
        button.titleLabel?.font = .robotoMedium14()
        button.titleEdgeInsets = UIEdgeInsets(top: 20,
                                              left: -100,
                                              bottom: 0, right: 0
        )
        button.setImage(UIImage(named: "soft_egg"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mediumEggButton: UIButton = {
        let button = UIButton()
        button.setTitle("MEDIUM", for: .normal)
        button.titleLabel?.font = .robotoMedium14()
        button.titleEdgeInsets = UIEdgeInsets(top: 20,
                                              left: -100,
                                              bottom: 0, right: 0
        )
        button.setImage(UIImage(named: "medium_egg"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let hardEggButton: UIButton = {
        let button = UIButton()
        button.setTitle("HARD", for: .normal)
        button.titleLabel?.font = .robotoMedium14()
        button.titleEdgeInsets = UIEdgeInsets(top: 20,
                                              left: -100,
                                              bottom: 0, right: 0
        )
        button.setImage(UIImage(named: "hard_egg"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonsStackView = UIStackView()
    
    // MARK: - Life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .cyan
        
        view.addSubview(mainLabel)
        
        buttonsStackView = UIStackView(
            arrangedSubviews: [
                softEggButton,
                mediumEggButton,
                hardEggButton,
            ],
            axis: .horizontal,
            spacing: 20)
        view.addSubview(buttonsStackView)
    }
    
    @objc private func  buttonTapped(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        if (hardness == "SOFT") {
            print("5")
        } else if (hardness == "MEDIUM") {
            print("7")
        } else {
            print("12")
        }
    }
}

// MARK: - SetConstraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            softEggButton.heightAnchor.constraint(equalToConstant: 130),
            softEggButton.widthAnchor.constraint(equalToConstant: 100),
        ])
        NSLayoutConstraint.activate([
            mediumEggButton.heightAnchor.constraint(equalToConstant: 130),
            mediumEggButton.widthAnchor.constraint(equalToConstant: 100),
        ])
        NSLayoutConstraint.activate([
            hardEggButton.heightAnchor.constraint(equalToConstant: 130),
            hardEggButton.widthAnchor.constraint(equalToConstant: 100),
        ])
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

