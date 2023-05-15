//
//  ViewController.swift
//  CargoLine
//
//  Created by Petro on 11.05.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var typeField: UITextField!
    @IBOutlet private weak var yearField: UITextField!
    @IBOutlet private weak var fuelField: UITextField!
    @IBOutlet private weak var brandField: UITextField!
    
    private let carTypes = CarType.allCases
    private let years = Array(2015...2023)
    private let fuel = Fuel.allCases
    private let brands = Brand.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confSegmnetedControl()
        confTextFields()
        clear()
    }
    
    private func confSegmnetedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: Country.ukraine.name, at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: Country.usa.name, at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func addPickerTo(textField: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
    }
    
    private func confTextFields() {
        addPickerTo(textField: typeField)
        addPickerTo(textField: yearField)
        addPickerTo(textField: fuelField)
        addPickerTo(textField: brandField)
    }
    
    private func clear() {
        typeField.text = carTypes[0].name
        yearField.text = String(years[0])
        fuelField.text = fuel[0].name
        brandField.text = brands[0].name
    }
    
    @IBAction private func countryDidChange(_ sender: UISegmentedControl) {
        clear()
    }
    
    @IBAction private func calculateDidTap(_ sender: Any) {
        func getValueForm(textField: UITextField) -> Int {
            guard let pickerView = textField.inputView as? UIPickerView else { return 0 }
            return pickerView.selectedRow(inComponent: 0)
        }
        
        let carType = carTypes[getValueForm(textField: typeField)].value
        let year: Double
        if years[getValueForm(textField: yearField)] <= 2018 {
            year = 500
        } else {
            year = 100
        }
        let fuel = fuel[getValueForm(textField: fuelField)].value
        let brand = brands[getValueForm(textField: brandField)].value
        
        guard let selectedCountry = Country(rawValue: segmentedControl.selectedSegmentIndex) else { return }
        
        let result = carType + year + fuel + brand * selectedCountry.value
        showAlertWith(title: String(result))
    }
    
    private func showAlertWith(title: String) {
        let alert = UIAlertController(title: "Your result:", message: title, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @IBAction private func cleanDidTap(_ sender: Any) {
        clear()
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
            return carTypes[row].name
        } else if pickerView == yearField.inputView {
            return String(years[row])
        } else if pickerView == fuelField.inputView {
            return fuel[row].name
        } else if pickerView == brandField.inputView {
            return brands[row].name
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typeField.inputView {
            typeField.text = carTypes[row].name
        } else if pickerView == yearField.inputView {
            yearField.text = String(years[row])
        } else if pickerView == fuelField.inputView {
            fuelField.text = fuel[row].name
        } else if pickerView == brandField.inputView {
            brandField.text = brands[row].name
        } else {
            return
        }
    }
}

