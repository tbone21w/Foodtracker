//
//  ViewController.swift
//  Foodtracker
//
//  Created by Todd Isaacs on 1/14/16.
//  Copyright © 2016 Todd Isaacs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   // MARK: Properties
   @IBOutlet weak var nameTextField: UITextField!
   @IBOutlet weak var mealNameLabel: UILabel!
   
   
   
   // MARK: overrides
   override func viewDidLoad() {
      super.viewDidLoad()
      
      //handle text field's user input through delegate callbacks
      nameTextField.delegate = self
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
   
   // MARK: UITextFieldDelegate
   func textFieldShouldReturn(textField: UITextField) -> Bool {
      //hide the keyboard
      textField.resignFirstResponder()
      
      return true
   }
   
   func textFieldDidEndEditing(textField: UITextField) {
      mealNameLabel.text = textField.text
   }

   
   
   // MARK: Actions
   @IBAction func setDefaultLabelText(sender: UIButton) {
      mealNameLabel.text = "Default Text"
   }

}

