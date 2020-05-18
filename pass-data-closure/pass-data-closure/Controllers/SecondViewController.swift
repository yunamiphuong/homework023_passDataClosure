//
//  SecondViewController.swift
//  pass-data-closure
//
//  Created by Apple on 5/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelShowInputNumber: UILabel!
    
    
    var randomNumber : Int = 0
    

    var numberInputFromVC1 : Int?
    var nameInputFromVC1 : String?

    
    var resultNumber : Int = 0
    var passObject : ((ResultNumber) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumber = Int.random(in: 0...100)
        
        if let number = numberInputFromVC1, let name = nameInputFromVC1  {
            labelShowInputNumber.text = "Số bạn \(name) đã chọn là \(number)"
            resultNumber = number
        }
        print("số randomNumber là \(randomNumber)")
        print("resultNumber là \(resultNumber)")
        
    }
    
    
    @IBAction func onCheckKetQua(_ sender: Any) {
            let viewController1 = ViewController()
//        print("số randomNumber là \(randomNumber)")
        viewController1.randomNumberFromVC2 = randomNumber
//        print("resultNumber là \(resultNumber)")
        
        passObject?(ResultNumber(resultNumber: randomNumber))
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
