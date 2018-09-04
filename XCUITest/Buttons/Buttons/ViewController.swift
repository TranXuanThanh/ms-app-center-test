//
//  ViewController.swift
//  Buttons
//
//  Created by Glenn Wilson on 8/31/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AmountLBL: UILabel!
    @IBOutlet weak var LessBtn: UIButton!
    @IBOutlet weak var MoreBtn: UIButton!
    @IBOutlet weak var ResetBtn: UIButton!
    
    var amount: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AmountLBL.textAlignment = NSTextAlignment.right
        DisplayAmount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func MoreBtnTouchDown(_ sender: Any) {
        amount += 1
        DisplayAmount()
    }
    
    @IBAction func LessBtnTouchDown(_ sender: Any) {
        amount -= 1
        DisplayAmount()
    }
    
    @IBAction func ResetBtnTouchDown(_ sender: Any) {
        amount = 0
        DisplayAmount()
    }
    
    func DisplayAmount() {
        AmountLBL.text = String(amount)
        AmountLBL.accessibilityValue = String(amount)
    }
}

