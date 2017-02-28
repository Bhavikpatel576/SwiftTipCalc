//
//  ViewController.swift
//  tipCalculator
//
//  Created by bhavik patel on 2/19/17.
//  Copyright © 2017 bhavik patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var totalBill: UITextField!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let tip_amt = defaults.integer(forKey: "def_t_pct")
        tipAmount.selectedSegmentIndex = tip_amt
        view.backgroundColor = UIColor(red: CGFloat(defaults.float(forKey: "red_slider_value")), green: CGFloat(defaults.float(forKey: "green_slider_value")), blue: CGFloat(defaults.float(forKey: "blue_slider_value")), alpha: 1)
    }

    @IBAction func onTap(_ sender: Any) {
        //print hello
        view.endEditing(true)
    }
    
    @IBAction func Bill(_ sender: AnyObject) {
        let tipPct = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPct[tipAmount.selectedSegmentIndex]
        let total = bill + tip
        totalBill.text = String(format: "$%.2f", total)
        tipField.text = String(format: "$%.2f", tip)
    }
}
