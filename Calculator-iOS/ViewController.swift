//
//  ViewController.swift
//  Calculator-iOS
//
//  Created by Tushar Gogna on 2023-12-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mCalculatorTxt: UILabel!
  
    private var calculation: Double = 0.0
    private var stringToShow = ""
    private var isPartOneDotAdded = false
    private var isPartTwoDotAdded = false

    private var partOne: Double = 0.0
    private var partTwo: Double = 0.0

    private var operation = ""
    
    override func viewDidLoad() {
      
    }
    
    @IBAction func mBtnAC(_ sender: UIButton) {
        partOne = 0
        partTwo = 0
        stringToShow = "\(partOne)"
        mCalculatorTxt.text = stringToShow
        operation = ""
    }
    @IBAction func mBtnPlus(_ sender: UIButton) {
        operation = "+"
        if(partOne != 0.0){
            if(isPartOneDotAdded){
                isPartOneDotAdded = false
                partOne = Double(stringToShow) ?? 0
                stringToShow.append(".0+")
            }
            else{
                 partOne = Double(stringToShow) ?? 0
                 stringToShow.append("+")
            }
        }
    }
    @IBAction func mBtn2(_ sender: UIButton) {
        enterNumber(value : 2)
        
        mCalculatorTxt.text = stringToShow
    }
    
    @IBAction func mBtn1(_ sender: UIButton) {
        enterNumber(value : 1)
        
        mCalculatorTxt.text = stringToShow
    }
    
    @IBAction func mBtnEqual(_ sender: UIButton) {
        performOperation()
    }
    
    @IBAction func mBtnDot(_ sender: UIButton) {
        if(!String(partOne).contains(".")){
            isPartOneDotAdded = true
        }
        if(!String(partTwo).contains(".")){
            isPartTwoDotAdded = true
        }
    }
    
    @IBAction func mBtn0(_ sender: UIButton) {
        enterNumber(value : 0)
        mCalculatorTxt.text = stringToShow
    }
    
    
    
    private func performOperation(){
        switch(operation){
        case "+":
          calculation =   partOne + partTwo
            stringToShow = "\(calculation)"
            mCalculatorTxt.text = stringToShow
         
        case "-":
            calculation =   partOne - partTwo
              stringToShow = "\(calculation)"
              mCalculatorTxt.text = stringToShow
        default:
            printContent("Default Ran")
        }
            
        
        calculation = 0
        partOne = 0.0
        partTwo = 0.0
        operation = ""
        stringToShow = "0"
    }
    
    private func enterNumber(value: Int){
        if(partOne == 0.0){
            if(isPartOneDotAdded){
                isPartOneDotAdded = false
                partOne = Double("0.\(value)") ?? 0
                stringToShow = "0.\(value)"
            }else{
                partOne = Double(value)
                stringToShow = "\(value)"
            }
        }else if(partTwo == 0.0){
            if(isPartTwoDotAdded){
                isPartTwoDotAdded = false
                partTwo = Double("0.\(value)") ?? 0
                stringToShow = "0.\(value)"
            }else{
                partTwo = Double(value)
                stringToShow = "\(value)"
            }
        }  else{
            stringToShow.append("\(value)")
        }
    }
     
}

