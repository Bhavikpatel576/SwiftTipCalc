//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by bhavik patel on 2/22/17.
//  Copyright © 2017 bhavik patel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaulttipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let percentIndex = defaults.integer(forKey: "def_t_pct")
        
        defaulttipController.selectedSegmentIndex = percentIndex
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tipchangeController(_ sender: Any) {
        let defaults = UserDefaults.standard
        let index = defaulttipController.selectedSegmentIndex
        
        defaults.set(index, forKey: "def_t_pct")
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
