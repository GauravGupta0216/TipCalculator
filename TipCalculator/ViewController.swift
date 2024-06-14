//
//  ViewController.swift
//  TipCalculator
//
//  Created by Gaurav Kumar on 14/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var percentageSegmentController: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!

    let numFormatter = NumberFormatter()
    let percentage = [0.1, 0.15, 0.25, 0.3]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numFormatter.numberStyle = .currency
        numFormatter.maximumFractionDigits = 2
    }

    @IBAction func calculateButtonAction(_ sender: Any) {
        calculateTip()
    }

    @IBAction func billAmountChanged(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func tipPercentageChanged(_ sender: Any) {
        calculateTip()
    }

    func calculateTip() {
        let billAmount = Double(billAmountTextField.text ?? "0.0") ?? 0.0
        let tipPercentage = percentage[percentageSegmentController.selectedSegmentIndex]
        let tip = billAmount * tipPercentage
        let totalBill = billAmount + tip
        let totalBillStr = numFormatter.string(for: totalBill) ?? "0.0"
        totalLabel.text = "total: \(totalBillStr)"
    }
}

