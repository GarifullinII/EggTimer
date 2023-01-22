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
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.5203130841, green: 0.8027799726, blue: 0.8295106292, alpha: 1)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        
    }
}

extension ViewController {
    
    private func setConstraints() {
        
    }
}

