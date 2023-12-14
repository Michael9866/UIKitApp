//
//  ViewController.swift
//  UIKitApp
//
//  Created by Michael Caine on 29.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainSlider: UISlider!
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var switchLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        setupLabel()
        switchLabel.text = "Hide Main Label"
        mainSegmentedControl.insertSegment(withTitle: "Third", at: 3, animated: false)
        mainSegmentedControl.isSelected = false
    }
    
    @IBAction func mainSegmentedControlAction() {
        switch mainSegmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func mainSliderAction() {
        mainLabel.text = String(format: "%.1f", mainSlider.value)
        //        view.backgroundColor = UIColor(red: 0.3, green: 0.6, blue: 0.7, alpha: CGFloat(mainSlider.value))
        
        // another method
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(mainSlider.value))
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = mainTextField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }
        
        mainLabel.text = mainTextField.text
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        mainLabel.isHidden = !sender.isOn
        switchLabel.text = !sender.isOn ? "Show Main Label" : "Hide Main Label"
    }
    
    
}
    
// MARK: - Private Methods
    extension ViewController {
        
        private func setupLabel() {
            mainLabel.text = mainSlider.value.formatted()
            mainLabel.font = mainLabel.font.withSize(35)
            mainLabel.textAlignment = .center
            mainLabel.textColor = .black
            mainLabel.numberOfLines = 2
        }
        
        private func setupSlider() {
            mainSlider.value = 0
            mainSlider.minimumValue = 0
            mainSlider.maximumValue = 1
            mainSlider.maximumTrackTintColor = .yellow
            mainSlider.minimumTrackTintColor = .red
            mainSlider.thumbTintColor = .lightGray
        }
    }

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.mainLabel.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

