//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    var countdown = 0
    var timer: Timer?
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        
        
        if timer != nil {
            timer?.invalidate()
        }
        
        countdownTimer(time: result)
    }
    
    func countdownTimer(time: Int) {
        countdown = time
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            countdown -= 1
            let progress = Float(countdown) / Float(time)
            timerProgress.progress = progress
            if countdown == 0 {
                timer.invalidate()
                titleLabel.text = "DONE!"
            }
        }
    }
}
