//
//  ViewController.swift
//  iSurvey
//
//  Created by ANI on 1/10/17.
//  Copyright © 2017 ANI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var surveyNameLabel        :UILabel!
    @IBOutlet var userFirstNameTextField :UITextField!
    @IBOutlet var zipCodeTextField       :UITextField!
    @IBOutlet var servesAlcoholSwitch    :UISwitch!
    @IBOutlet var userRatingStepper      :UIStepper!
    @IBOutlet var serviceRatingSlider    :UISlider!
    @IBOutlet var decorRatingSegControl  : UISegmentedControl!
    
    //MARK: - Interactivity Methods
    
    @IBAction func pressed(button: UIButton) {
        guard let name = userFirstNameTextField.text else {
            return
        }
        surveyNameLabel.text = "\(name) Favorite Restaurant"
    }
    
    @IBAction func valueChanged(aSwitch: UISwitch) {
        print("Is On? \(aSwitch.isOn)")
    }
    
    @IBAction func valueChanged(stepper: UIStepper) {
        print("Stepper: \(stepper.value)")
    }
    
    @IBAction func valueChanged(slider: UISlider) {
        print("Slider: \(slider.value)")
    }
    
    @IBAction func valueChanged(segControl: UISegmentedControl) {
        let name = segControl.titleForSegment(at: segControl.selectedSegmentIndex)!
        print("Seg \(name)")
    }
    
    @IBAction func valueChanged(datePicker: UIDatePicker) {
        print("Date: \(datePicker.date)")
    }
    
    //MARK: - PickerView Delegate Methods
    
    let colorArr = ["Red", "Green", "Blue", "Yellow"]
    let clothesArr = ["Shirt", "Pants", "Shoes", "Skirt", "Hat"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return colorArr.count
        } else if component == 1 {
            return clothesArr.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return colorArr[row]
        } else if component == 1 {
            return clothesArr[row]
        }
        return "???"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var name = ""
        if component == 0 {
            name = colorArr[row]
        } else if component == 1 {
            name = clothesArr[row]
        }
        print("Row: \(row): \(name)")
    }
    
    //MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == zipCodeTextField {
            let numsCharSet = CharacterSet(charactersIn: "1234567890").inverted
            let filtered = string.components(separatedBy: numsCharSet).joined()
            if string != filtered {
                return false
            }
        }
        return true
    }
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userFirstNameTextField.delegate = self
        servesAlcoholSwitch.isOn = false
        userRatingStepper.value = 5
        serviceRatingSlider.value = 0
        decorRatingSegControl.selectedSegmentIndex = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

