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
    
    // variables to capture time left and to update labels. For now time fixed for 90 mins.
    var totalSecondsLeft: Int = 5400
    var timeArray: [String] = ["01","30", "00"]
    
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
        totalSecondsLeft -= 1
        
        if totalSecondsLeft == 0 {
            timer?.invalidate()
        }
        getHourMinutesAndSeconds(timeLeft: totalSecondsLeft)
        
        // update time values from the time array
        hourLbl.text = timeArray[0]
        minutesLbl.text = timeArray[1]
        secondsLbl.text = timeArray[2]
    }
    
    private func getHourMinutesAndSeconds(timeLeft: Int) {
        
        let hoursLeft = Int(timeLeft/3600)
        if hoursLeft < 10 {
            timeArray[0] = "0\(String(hoursLeft))"
        } else {
            timeArray[0] = String(hoursLeft)
        }
        
        
        let remainingMins = timeLeft%3600 // 1799
        let mintsLeft = Int(remainingMins/60) // 29
        if mintsLeft < 10 {
            timeArray[1] = "0\(String(mintsLeft))"
        } else {
            timeArray[1] = String(mintsLeft)
        }
        
        let secondsLeft = remainingMins%60
        if secondsLeft < 10 {
            timeArray[2] = "0\(String(secondsLeft))"
        } else {
            timeArray[2] = String(secondsLeft)
        }
    }
    
    private func initializeTimer(){
        hourLbl.text = "01"
        minutesLbl.text = "30"
        secondsLbl.text = "00"
    }
}

