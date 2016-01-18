//
//  MealViewController.swift
//  Foodtracker
//
//  Created by Todd Isaacs on 1/14/16.
//  Copyright © 2016 Todd Isaacs. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   // MARK: Properties
   @IBOutlet weak var nameTextField: UITextField!
   @IBOutlet weak var photoImageView: UIImageView!
   @IBOutlet weak var ratingControl: RatingControl!
   
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
      
   }

   
   // MARK: UIImagePickerControllerDelegate
   func imagePickerControllerDidCancel(picker: UIImagePickerController) {
      dismissViewControllerAnimated(true, completion: nil)
   }
   
   func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
      
      //use this image and close
      photoImageView.image = selectedImage
      dismissViewControllerAnimated(true, completion: nil)
   }
   
   
   // MARK: Actions   
   @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
      //hide keyboard it may be open
      nameTextField.resignFirstResponder()
      let imagePickerController = UIImagePickerController()
      
      //only allow photos to be picked not taken
      imagePickerController.sourceType = .PhotoLibrary
      
      imagePickerController.delegate = self
      presentViewController(imagePickerController, animated: true, completion: nil)
   }

}

