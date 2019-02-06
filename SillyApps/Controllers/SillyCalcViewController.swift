//
//  SillyCalcViewController.swift
//  SillyApps
//
//  Created by sinahk on 2/6/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import UIKit

class SillyCalcViewController: UIViewController {
    
    var operandStack = Array<Double>()
    var userIsTyping = false
    
    var displayValue :Double{
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }set{
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    func doCalc2(calc2: (Double,Double) -> Double){
        if operandStack.count >= 2{
            displayValue = calc2(operandStack.removeLast(), operandStack.removeLast())
            returnButtonPressed()
        }
    }
    
    func doCalc1(calc1: (Double) -> Double){
        if operandStack.count >= 1{
            displayValue = calc1(operandStack.removeLast())
            returnButtonPressed()
        }
    }
    
    
    @IBAction func returnButtonPressed() {
        operandStack.append(displayValue)
        print("\(operandStack)")
        userIsTyping = false
    }
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numberPressed(_ sender: Any) {
        let digit = (sender as AnyObject).currentTitle!
        if userIsTyping {
            display.text = display.text! + digit!
        }else{
            display.text = digit!
            userIsTyping = true
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        operandStack.removeAll()
        display.text = "0"
        userIsTyping = false
    }
    
    @IBAction func calculationButton(_ sender: Any) {
        let buttonRecieved = (sender as AnyObject).currentTitle!
        if(userIsTyping){
            returnButtonPressed()
        }
        
        if operandStack.count >= 2 {
            switch buttonRecieved {
            case "×"?:
                doCalc2(calc2: {(op1, op2) in return op1 * op2})
            case "÷"?:
                doCalc2(calc2: {(op1, op2) in return op2 / op1})
            case "-"?:
                doCalc2(calc2: {(op1, op2) in return op2 - op1})
            case "+"?:
                doCalc2(calc2: {(op1, op2) in return op1 + op2})
            case "√"?:
                doCalc1(calc1: {(op1) in return pow(op1,0.5)})
            case "cos"?:
                doCalc1(calc1: {(op1) in return cos(op1 * Double.pi / 180)})
            default:
                break
            }
            
            
        }
        else if operandStack.count >= 1{
            switch buttonRecieved{
            case "√"?:
                doCalc1(calc1: {(op1) in return pow(op1,0.5)})
            case "cos"?:
                doCalc1(calc1: {(op1) in return cos(op1 * Double.pi / 180)})
            default:
                break
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
