//
//  SillyStopWatchViewController.swift
//  SillyApps
//
//  Created by sinahk on 2/8/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import UIKit

class SillyStopWatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var stopWatchTimer: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBAction func startButtonAction(_ sender: Any) {
        makeStartAppear(makeAppear: true)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
        timeArray.removeAllObjects()
        tableView.reloadData()
        counter = 1
    }
    
    
    @IBOutlet weak var stopButtonOutlet: UIButton!
    @IBAction func stopButtonAction(_ sender: Any) {
        makeStartAppear(makeAppear: false)
        timer.invalidate()
    }
    
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBAction func resetButtonAction(_ sender: Any) {
        timeArray.add("\(counter) -> " + stopWatchTimer.text!)
        counter = counter + 1
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var counter = 1
    var startTime = TimeInterval()
    var timer : Timer = Timer()
    var timeArray : NSMutableArray = NSMutableArray()
    
    @objc func updateTime(){
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var elapsedTime : TimeInterval = currentTime - startTime
        let minutes = UInt8(elapsedTime/60.0)
        elapsedTime -= (TimeInterval(minutes)*60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= (TimeInterval(seconds))
        
        let fraction = UInt8(elapsedTime*100)
        
        let strMinutes = minutes>9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds>9 ? String(seconds):"0" + String(seconds)
        let strFractions = fraction>9 ? String(fraction):"0" + String(fraction)
        
        stopWatchTimer.text = "\(strMinutes):\(strSeconds):\(strFractions)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel!.text = self.timeArray.object(at: indexPath.row) as? String
        return cell
    }
    
    func makeStartAppear(makeAppear: Bool){
        if makeAppear {
            print("true")
            startButtonOutlet.isHidden = true
            stopButtonOutlet.isHidden = false
            resetButtonOutlet.isHidden = false
        }else{
            print("false")
            startButtonOutlet.isHidden = false
            stopButtonOutlet.isHidden = true
            resetButtonOutlet.isHidden = true
        }
    }
    
    
}
