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
    //Button Outlets
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    //Slider Outlets
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let percentIndex = defaults.integer(forKey: "def_t_pct")
            defaulttipController.selectedSegmentIndex = percentIndex
        //colorUpdate()
        //updateSliders()
        view.layer.borderWidth = 5
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        //code to update the background color from previous settings
        redSwitch.isOn = defaults.bool(forKey: "r_switch")
        greenSwitch.isOn = defaults.bool(forKey: "g_switch")
        blueSwitch.isOn = defaults.bool(forKey: "b_switch")
        updateSliders()
        redSlider.value = defaults.float(forKey: "red_slider_value")
        greenSlider.value = defaults.float(forKey: "green_slider_value")
        blueSlider.value = defaults.float(forKey: "blue_slider_value")
        colorUpdate()
    
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
    
    @IBAction func switchChanged(_ sender: UISwitch){
        colorUpdate()
        updateSliders()
        let defaults = UserDefaults.standard
        defaults.set(redSwitch.isOn, forKey: "r_switch")
        defaults.set(greenSwitch.isOn, forKey: "g_switch")
        defaults.set(blueSwitch.isOn, forKey: "b_switch")
        defaults.synchronize()
        
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        colorUpdate()
    }

    func colorUpdate(){
        let defaults = UserDefaults.standard
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if (redSwitch.isOn) {
            red = CGFloat(redSlider.value)
        }
        if (greenSwitch.isOn) {
            green = CGFloat(greenSlider.value)
        }
        if (blueSwitch.isOn) {
            blue = CGFloat(blueSlider.value)
        }

        defaults.set(red, forKey: "red_slider_value")
        defaults.set(green, forKey: "green_slider_value")
        defaults.set(blue, forKey: "blue_slider_value")
        defaults.synchronize()
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        view.backgroundColor = color

    }
    
    func updateSliders(){
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
        //redSlider.value = UserDefaults.standard.float(forKey: "red_slider_value")
    }

}
