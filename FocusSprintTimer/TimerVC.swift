//
//  ViewController.swift
//  FocusSprintTimer
//
//  Created by Sunimal Herath on 5/2/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {

    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var minutesLbl: UILabel!
    @IBOutlet weak var secondsLbl: UILabel!
    
    // variables to capture how much time left
    var secondsLeft: Int = 60
    var minutesLeft: Int = 30
    var hoursLeft: Int = 1
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTimer()
    }

    @IBAction func startBtnPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopBtnPressed(_ sender: Any) {
        timer?.invalidate()
    }
    
    // function to calculate timing
    @objc func runTimer(){
        secondsLeft -= 1
        secondsLbl.text = String(secondsLeft)
        
        if secondsLeft < 10 {
            secondsLbl.text = "0\(secondsLeft)"
        }
        
        if secondsLeft == 0 {
            secondsLeft = 60
            minutesLeft -= 1
            minutesLbl.text = String(minutesLeft)
        }
        
        if minutesLeft < 10 {
            minutesLbl.text = "0\(minutesLeft)"
        }
        
        if hoursLeft == 0 && minutesLeft == 0 {
            // time ends
            timer?.invalidate()
        }
        
        if minutesLeft == 0 {
            hoursLeft = 0
            hourLbl.text = "00"
            minutesLeft = 60
            secondsLeft = 60
        }
    }
    
    private func initializeTimer(){
        hourLbl.text = "01"
        minutesLbl.text = "30"
        secondsLbl.text = "00"
    }
}

