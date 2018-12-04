//
//  ViewController.swift
//  MoodAnalyzer
//
//  Created by Manoj Kulkarni on 12/4/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.moodTextField.delegate = self
    }

    @IBAction func onAnalyzeButtonClicked(_ sender: UIButton) {
        
        guard self.moodTextField.text != "" else {
            self.moodLabel.text = "Please enter a sentence."
            return
        }
        
        guard let sentence = self.moodTextField.text else {
            return
        }
        
        let moodAnalysis = MoodAnalysis(textInput: sentence)
        self.moodLabel.text = moodAnalysis.mood.mood
        self.moodTextField.text = ""
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

