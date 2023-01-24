//
//  ViewController.swift
//  EggTimer
//
//  Created by Ildar Garifullin on 23/01/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
//    var timer: Timer?
    
    var totalTime = 0
    var secondsPassed = 0
    
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
    
    private let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.trackTintColor = .white
        progress.progressTintColor = .red
        progress.setProgress(0, animated: false)
        progress.translatesAutoresizingMaskIntoConstraints = false
        
        return progress
    }()
    
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
        view.addSubview(progressView)
    }
    
    @objc private func keyboardButtonTapped(sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressView.progress = 0.0
        secondsPassed = 0
        eggLabel.text = hardness
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true)
        
//        if let hardness = hardness {
//            guard let eggTimes = eggTimes[hardness] else {
//                return
//            }
//            startCountdown(eggTimes: eggTimes)
//
//        } else {
//            print("The button don't have title")
//        }
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressView.progress = percentageProgress
        } else {
            timer.invalidate()
            eggLabel.text = "Bon appetit!"
            playSound()
        }
    }
    
//    func startCountdown(eggTimes: Int) {
//
//        var seconds = eggTimes * 60
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            seconds -= 1
//            if seconds == 0 {
//                print("Bon appetit!")
//                timer.invalidate()
//            } else {
//                print(seconds)
//            }
//        }
//    }
    
//    deinit {
//        timer?.invalidate()
//    }
    
    private func playSound() {
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        if let url = url {
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
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
        ])
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            progressView.topAnchor.constraint(equalTo: eggStackView.bottomAnchor, constant: 100),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

