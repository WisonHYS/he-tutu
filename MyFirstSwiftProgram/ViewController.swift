//
//  ViewController.swift
//  MyFirstSwiftProgram
//
//  Created by 贺赟生 on 16/1/7.
//  Copyright © 2016年 贺赟生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ResultLabel: UILabel!
    var firstOperand:Double = 0.0 //第一个数
    var secondOperand:Double = 0.0//第二个数
    var isUsingPointFlag:Bool = false //是否使用小数点
    var isSecond:Bool = false//是否输入了第二个数
    var opearand:String = ""//运算符
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.layer.cornerRadius = 8.0
        ResultLabel.layer.masksToBounds = true
        
    }
    
    
    
    @IBAction func buttonTap(sender: UIButton) {
        
        if ResultLabel.text == "0"||(isSecond && secondOperand == 0.0) {
            
            ResultLabel.text = ""
            
        }
        
        ResultLabel.text = ResultLabel.text! + sender.titleLabel!.text!
        
        if isSecond{
            
            secondOperand = (ResultLabel.text! as NSString).doubleValue
            
        }else{
            
            firstOperand = (ResultLabel.text! as NSString).doubleValue
            
        }
        
    }
    
    @IBAction func pointTap(sender: UIButton) {
        if !isUsingPointFlag{
            ResultLabel.text = ResultLabel.text! + "."
            if isSecond{
                secondOperand = NSString(string: ResultLabel.text!).doubleValue
            }else{
                firstOperand = NSString(string: ResultLabel.text!).doubleValue
            }
            isUsingPointFlag = !isUsingPointFlag
        }
    }
    
    @IBAction func operatorTap(sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            isUsingPointFlag = false
            switch sender.titleLabel!.text!{
            case "+":
                opearand = "+"
            case "-":
                opearand = "-"
            case "÷":
                opearand = "/"
            case "x":
                opearand = "x"
            default:
                opearand = ""
            }
        }
        
    }
    
    @IBAction func resultTap(sender: UIButton) {
        if isSecond{
            if opearand == "/" && secondOperand == 0{
                let alterView = UIAlertView(title: "Error", message: "除数不能为0", delegate: self, cancelButtonTitle: "确定")
                alterView.show()
                return
            }
            var result : Double = 0.0
            switch opearand{
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "x":
                result = firstOperand * secondOperand
            case "/":
                result = firstOperand / secondOperand
            default:
                result = 0.0
                
            }
            var result_a:Int = 0;
            if result.description.hasSuffix(".0"){
                result_a = Int(result)
            }
            ResultLabel.text = result_a.description
        }
    }
    
    @IBAction func clearTap(sender: UIButton) {
        ResultLabel.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        isUsingPointFlag = false
        isSecond = false
        opearand = ""
    }
    
    
}

