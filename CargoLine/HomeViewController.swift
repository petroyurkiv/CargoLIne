//
//  ViewController.swift
//  CargoLine
//
//  Created by Petro on 11.05.2023.
//

import UIKit

import Foundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var fuelField: UITextField!
    @IBOutlet weak var brandField: UITextField!
    
    let carTypes = CarType.allCases
    let years = Array(2015...2023)
    let fuel = Fuel.allCases
    let brands = Brand.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confSegmnetedControl()
        confTextFields()
    }
    
    func confSegmnetedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Ukraine", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "USA", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func addPickerTo(textField: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
    }
    
    func confTextFields() {
        addPickerTo(textField: typeField)
        addPickerTo(textField: yearField)
        addPickerTo(textField: fuelField)
        addPickerTo(textField: brandField)
    }
    
    @IBAction func countryDidChange(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func calculateDidTap(_ sender: Any) {
        
    }
    
    @IBAction func cleanDidTap(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == typeField.inputView {
            return carTypes.count
        } else if pickerView == yearField.inputView {
            return years.count
        } else if pickerView == fuelField.inputView {
            return fuel.count
        } else if pickerView == brandField.inputView {
            return brands.count
        } else {
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == typeField.inputView {
            return String(carTypes[row].value)
        } else if pickerView == yearField.inputView {
            return String(years[row])
        } else if pickerView == fuelField.inputView {
            return String(fuel[row].value)
        } else if pickerView == brandField.inputView {
            return String(brands[row].value)
        } else {
            return ""
        }
        
    }
}

