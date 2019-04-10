//
//  PreferenceViewController.swift
//  OCR and Translate
//
//  Created by Peter XU on 4/7/19.
//  Copyright © 2019 Peter XU. All rights reserved.
//

import Cocoa

class PreferenceViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let defaults = UserDefaults.standard
        let nOfService = defaults.integer(forKey: "SelectedService")
        if let arr = defaults.array(forKey: "APIKeys") {
            APIKeyTextField.stringValue = arr[nOfService] as? String ?? ""
        } else {
            APIKeyTextField.stringValue = ""
        }
//        APIKeyTextField.stringValue = defaults.string(forKey: "APIKey") ?? ""
        ServiceSelectPopUpButton.selectItem(at: nOfService)
    }
    
    @IBOutlet weak var APIKeyTextField: NSTextField!
    @IBOutlet weak var ServiceSelectPopUpButton: NSPopUpButton!
    
    @IBAction func editAPIKeyTextField(_ sender: Any) {
        let defaults = UserDefaults.standard
        let nOfService = defaults.integer(forKey: "SelectedService")
        if let arr = defaults.array(forKey: "APIKeys") {
            var newarr: [String] = [arr[0] as? String ?? "", arr[1] as? String ?? ""]
            newarr[nOfService] = APIKeyTextField.stringValue
            defaults.set(newarr, forKey: "APIKeys")
        } else {
            var newarr: [String] = ["", ""]
            newarr[nOfService] = APIKeyTextField.stringValue
            defaults.set(newarr, forKey: "APIKeys")
        }
        defaults.set(APIKeyTextField.stringValue, forKey: "APIKey")
    }
    @IBAction func changeServiceSelectPopUpButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        let nOfService = ServiceSelectPopUpButton.indexOfSelectedItem
        
        defaults.set(nOfService, forKey: "SelectedService")
        
        if let arr = defaults.array(forKey: "APIKeys") {
            APIKeyTextField.stringValue = arr[nOfService] as? String ?? ""
            defaults.set(APIKeyTextField.stringValue, forKey: "APIKey")
        } else {
            APIKeyTextField.stringValue = ""
            defaults.set(APIKeyTextField.stringValue, forKey: "APIKey")
        }
    }
}
