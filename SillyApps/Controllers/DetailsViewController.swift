//
//  DetailsViewController.swift
//  SillyApps
//
//  Created by sinahk on 2/8/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import UIKit
import AVFoundation

class DetailsViewController: UIViewController {
    
    var timer = Timer()
    var timerIsRunning = false
    var timerCount = 5
    var exerciseNumbr = -1
    var soundIsOn = true
    var synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    func speakText(text: String){
        if soundIsOn {
            myUtterance = AVSpeechUtterance(string: text)
            myUtterance.rate = 0.4
            synth.speak(myUtterance)
        }
    }
    
    func startStopTimer( ){
        if !timerIsRunning{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counting), userInfo: nil, repeats: true)
            timerIsRunning = true
            pauseButtonOutlet.setTitle("Pause", for: .normal)
        }else{
            timer.invalidate()
            timerIsRunning = false
            pauseButtonOutlet.setTitle("Resume", for: .normal)
        }
    }
    
    @objc func counting(){
        timerCount = timerCount - 1
        timeLeftLabelOutlet.text = "\(timerCount)"
        if timerCount == 0{
            nextExercise()
        }
        
    }
    
    var theExerciseNumber = 1
    let myExcData = ExerciseData()
    var exercises = [] as NSArray
    var width = UIScreen.main.bounds.width
    var heigth = UIScreen.main.bounds.height

    func nextExercise(){
        exerciseNumbr = exerciseNumbr + 1
        var exerciseText = ""
        if myExcData.getExercises().count > exerciseNumbr{
            exerciseText = myExcData.getExercises()[myExcData.getExercises().startIndex + exerciseNumbr].title
            exerciseNameLabelOutlet.text = exerciseText
            speakText(text: exerciseNameLabelOutlet.text!)
        }
        
        setImage()
        
        if exerciseNumbr % 2 == 1{
            timerCount = 5
        }else{
            timerCount = 10
            exerciseNumLabel.text = "Exercise \(myExcData.getExercises().startIndex + theExerciseNumber) of 50"
            theExerciseNumber = theExerciseNumber + 1
            
        }
        if exerciseNumbr == 50{
            startStopTimer()
        }
        
        timeLeftLabelOutlet.text = String(timerCount)
        
    }
    
    func setImage(){
        if myExcData.getExercises().count > exerciseNumbr{
            let exerciseImage = myExcData.getExercises()[myExcData.getExercises().startIndex + exerciseNumbr].image
            print(myExcData.getExercises()[myExcData.getExercises().startIndex + exerciseNumbr])
            let theImageView = UIImageView(image: exerciseImage!)
            theImageView.frame = CGRect(x: mainImageView.bounds.minX, y: mainImageView.bounds.minY, width: mainImageView.bounds.width, height: mainImageView.bounds.height)
            self.mainImageView.addSubview(theImageView)
            
        }
    }
    @IBOutlet weak var soundButtonOutlet: UIButton!
    @IBAction func soundButtonAction(_ sender: Any) {
        if soundIsOn{
            soundButtonOutlet.setTitle("🔇", for: .normal)
            soundIsOn = false
        } else{
            soundButtonOutlet.setTitle("🔈", for: .normal)
            soundIsOn = false
        }
    }
    
    @IBOutlet weak var exerciseNumLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    @IBAction func pauseButtonAction(_ sender: Any) {
        startStopTimer()
    }
    
    @IBOutlet weak var exerciseNameLabelOutlet: UILabel!
    @IBOutlet weak var timeLeftLabelOutlet: UILabel!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopTimer()
        nextExercise()
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
