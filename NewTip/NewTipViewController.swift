//
//  NewTipViewController.swift
//  
//
//  Created by Damon Redding on 12/31/15.
//
//

import UIKit

class NewTipViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlet

    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var numberOfPeopleLabeled: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    // MARK: - Properties
    var tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2)
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(tipCalc.tipPercentage * 100)])
        
    }
    func calcTip()
    {
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text) as NSString).floatValue
        tipCalc.calculateTip()
        updateUI()
    }
    func updateUI()
    {
        resultLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", arguments: [tipCalc.totalAmount, tipCalc.tipAmount])
    }
    // MARK: - UIControl Events
    @IBAction func amountBeforeTaxTextFieldChange(sender: AnyObject){
        calcTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == amountBeforeTaxTextField {
            textField.resignFirstResponder()
            calcTip()
        }
        return true
    }
    
    @IBAction func tipPercentageSliderValueChanged(sender: AnyObject) {
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
}
