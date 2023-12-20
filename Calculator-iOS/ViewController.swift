//
//  ViewController.swift
//  Calculator-iOS
//
//  Created by Tushar Gogna on 2023-12-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mCalculatorTxt: UILabel!
  
    private var calculation = 0
    private var stringToShow = ""
    private var isDotAdded = false

    override func viewDidLoad() {
      
    }
    
    @IBAction func mBtnAC(_ sender: UIButton) {
        calculation = 0
        stringToShow = "\(calculation)"
        mCalculatorTxt.text = stringToShow
    }
    @IBAction func mBtnPlus(_ sender: UIButton) {
        
    }
    @IBAction func mBtn2(_ sender: UIButton) {
        if(calculation == 0){
            if(isDotAdded){
                isDotAdded = false
                calculation = 2
                stringToShow = "\(0.2)"
            }else{
                calculation = 2
                stringToShow = "\(2)"
            }
        }else{
            if(isDotAdded){
                isDotAdded = false
                calculation = 2
                stringToShow.append("\(2.2)")
            }else{
                stringToShow.append("\(2)")
            }
        }
        
        mCalculatorTxt.text = stringToShow
    }
    @IBAction func mBtn1(_ sender: UIButton) {
        if(calculation == 0){
            calculation = 1
            stringToShow = "\(1)"
        }else{
            stringToShow.append("\(1)")
        }
        
        mCalculatorTxt.text = stringToShow
    }
    
    @IBAction func mBtnEqual(_ sender: UIButton) {
    }
    
    @IBAction func mBtnDot(_ sender: UIButton) {
        if(!stringToShow.contains(".")){
            isDotAdded = true
        }
    }
    
    @IBAction func mBtn0(_ sender: UIButton) {
        if(calculation == 0){
            calculation = 0
            stringToShow = "\(0)"
        }else{
            stringToShow.append("\(0)")
        }
        
        mCalculatorTxt.text = stringToShow
    }
     
}

