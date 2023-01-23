//
//  ViewController.swift
//  EggTimer
//
//  Created by Ildar Garifullin on 23/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    private let eggLabel: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = label.font.withSize(28)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let eggSoftButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "soft_egg"), for: .normal)
        button.setTitle("Soft", for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let eggMediumButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "medium_egg"), for: .normal)
        button.setTitle("Medium", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let eggHardButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "hard_egg"), for: .normal)
        button.setTitle("Hard", for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
            arrangedSubviews: [eggSoftButton, eggMediumButton, eggHardButton],
            axis: .horizontal,
            spacing: 10,
            distribution: .fillEqually
        )
        
        view.addSubview(eggStackView)
    }
    
    @objc private func keyboardButtonTapped(sender: UIButton) {
        if sender.tag == 0 {
            print(softTime)
        } else if sender.tag == 1 {
            print(mediumTime)
        } else if sender.tag == 2 {
            print(hardTime)
        }
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

