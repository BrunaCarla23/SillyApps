//
//  SillyTimerViewController.swift
//  SillyApps
//
//  Created by sinahk on 2/8/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import UIKit

class SillyTimerViewController: UIViewController {
    
    var counter = 0
    var timer = Timer()
    var timerIsRunningStart = false
    var timerIsRunningContinue = false
    var lastValue = 0
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerLabel.text = "\(counter)"
        minuteLabel.text = "\(Int(minuteSlider.value)) min"
        secondsLabel.text = "\(Int(secondsSlider.value)) secs"
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var stopButton: UIButton!
    @IBAction func stopButtonPressed(_ sender: Any) {
        timer.invalidate()
        makeContinueAppear(makeAppear: true)
        timerIsRunningStart = false
        timerIsRunningContinue = false
    }
    
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func resetButtonAction(_ sender: Any) {
        makeStartAppear(makeAppear: false)
        timerIsRunningStart = false
        timerIsRunningContinue = false
        counter = 0
        timer.invalidate()
        TimerLabel.text = String(counter)
    }
    
    
    @IBOutlet weak var continueOutlet: UIButton!
    @IBAction func continuePressed(_ sender: Any) {
        if (!timerIsRunningContinue){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        makeContinueAppear(makeAppear: false)
        timerIsRunningContinue = false
        timerIsRunningStart = false
    }
    
    @IBOutlet weak var minuteSlider: UISlider!{
        didSet{
            // minuteSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        }
    }
    @IBAction func minuteSliderAction(_ sender: Any) {
        minuteLabel.text = "\(Int(minuteSlider.value)) min"
    }
    
    @IBOutlet weak var secondsSlider: UISlider!{
        didSet{
            //secondsSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        }
    }
    @IBAction func secondsSlider(_ sender: Any) {
        secondsLabel.text = "\(Int(secondsSlider.value)) secs"
    }
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var startButtonTimer: UIButton!
    @IBAction func startButtonTimerPressed(_ sender: Any) {
        TimerLabel.text = timeString(time: Int(secondsSlider.value) + Int(minuteSlider.value) * 60)
        TimerLabel.backgroundColor = UIColor.white
        
        if (!timerIsRunningStart && !timerIsRunningContinue){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            counter = counter + Int(secondsSlider.value) + (Int(minuteSlider.value) * 60)
        }
        makeStartAppear(makeAppear: true)
        timerIsRunningStart = true
        timerIsRunningContinue = false
    }
    
    @objc func updateTimer(){
        counter = counter - 1
        TimerLabel.text = timeString(time: counter)
        if counter < 0{
            counter = 0
            TimerLabel.text = "دلخوشی های کوچولو !!"
            TimerLabel.backgroundColor = UIColor.red
            timer.invalidate()
            makeStartAppear(makeAppear: false)
            timerIsRunningStart = false
        }
        
        
    }
    
    func makeContinueAppear( makeAppear: Bool){
        if makeAppear{
            continueOutlet.isHidden = false
            stopButton.isHidden = true
        }else{
            continueOutlet.isHidden = true
            stopButton.isHidden = false
        }
    }
    
    func makeStartAppear(makeAppear: Bool){
        if makeAppear {
            print("true")
            startButtonTimer.isHidden = true
            stopButton.isHidden = false
            resetButton.isHidden = false
        }else{
            print("false")
            startButtonTimer.isHidden = false
            stopButton.isHidden = true
            resetButton.isHidden = true
            continueOutlet.isHidden = true
        }
    }
    

}
