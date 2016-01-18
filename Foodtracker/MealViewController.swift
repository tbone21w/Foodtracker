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
   @IBOutlet weak var saveButton: UIBarButtonItem!
   
   /*
      this value is either passd by 'MealTableViewController' in 'prepareForSegue(_:sender)'
      or constructed as part of adding a new meal.
   */
   var meal: Meal?
   
   // MARK: overrides
   override func viewDidLoad() {
      super.viewDidLoad()
      
      //handle text field's user input through delegate callbacks
      nameTextField.delegate = self
      
      //if we have a meal unwrap and set values in UI
      if let meal = meal {
         navigationItem.title = meal.name
         nameTextField.text = meal.name
         photoImageView.image = meal.photo
         ratingControl.rating = meal.rating
      }
      
      //Enable the Save button only if the text field has a valid meal name
      checkValidMealname()
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
      checkValidMealname()
      navigationItem.title = textField.text
   }
   
   func textFieldDidBeginEditing(textField: UITextField) {
      //disable save while editing
      saveButton.enabled = false
   }

   func checkValidMealname() {
      //disable the Save button if the text field is empty
      let text = nameTextField.text ?? ""
      saveButton.enabled = !text.isEmpty
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
   
   // MARK: Navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if saveButton === sender {
         let name = nameTextField.text ?? ""
         let photo = photoImageView.image
         let rating = ratingControl.rating
         
         meal = Meal(name: name, photo: photo, rating: rating)
      }
   }
   
   @IBAction func cancel(sender: UIBarButtonItem) {
      //Determine if view came from nav controller (ShowDetail --> nav) or not (AddItem --> modal)
      let isPresentingInAddMealMode = presentingViewController is UINavigationController
      
      if isPresentingInAddMealMode {
         dismissViewControllerAnimated(true, completion: nil)
      } else {
         navigationController!.popViewControllerAnimated(true)
      }
      
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

