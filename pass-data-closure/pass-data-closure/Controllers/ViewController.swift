//
//  ViewController.swift
//  pass-data-closure
//
//  Created by Apple on 4/30/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var labelSoTrungThuong: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    var timer : Timer!
    var isYellow : Bool = true
    
    //    var numberFromVC2 : Int?
    
    
    
    var inputNumber : Int = 0
    var inputUsername : String = ""
    
    var randomNumberFromVC2 : Int = 0
    var textTrungThuong : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Game Vui Có Thưởng!"
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(blinkingLabel), userInfo: nil, repeats: true)
        isYellow = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesture)
        
        labelSoTrungThuong.text = "Hãy nhập tên và số bất kỳ từ 0 - 100"
        
        if let text = textTrungThuong {
            labelSoTrungThuong.text = text
        }
        
        
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    @objc func blinkingLabel() {
        if isYellow {
            label2.isHidden = false
            isYellow = false
        }
        else {
            label2.isHidden = true
            isYellow = true
        }
        
    }
    
    @IBAction func onQuaySo(_ sender: Any) {
        
        inputNumber = Int(textField1.text ?? "fail") ?? 0
        print("số inputnumber là \(inputNumber)")
        inputUsername = usernameTextField.text ?? ""
        
        let secondVC = SecondViewController()
        secondVC.numberInputFromVC1 = inputNumber
        secondVC.nameInputFromVC1 = inputUsername
        
        //        if inputNumber == randomNumberFromVC2 {
        //                    labelSoTrungThuong.text = "Bạn đã trúng thưởng"
        //        } else {
        //             labelSoTrungThuong.text = "Bạn không trúng thưởng"
        //        }
        //
        secondVC.passObject = { [weak self] data in
            guard let selfVC1 = self else {
                return
            }
            
            selfVC1.randomNumberFromVC2 = data.resultNumber
            if selfVC1.inputNumber == selfVC1.randomNumberFromVC2 {
                selfVC1.labelSoTrungThuong.text = "Bạn đã trúng thưởng với kết quả \(selfVC1.randomNumberFromVC2)"
            } else {
                selfVC1.labelSoTrungThuong.text = "Bạn không trúng thưởng, kết quả trúng thưởng là \(selfVC1.randomNumberFromVC2)"
            }
        }
        
         self.present(secondVC, animated: true, completion: nil)
    }
   
}






