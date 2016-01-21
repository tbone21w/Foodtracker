//
//  RatingController.swift
//  Foodtracker
//
//  Created by Todd Isaacs on 1/17/16.
//  Copyright © 2016 Todd Isaacs. All rights reserved.
//

import UIKit

class RatingControl: UIView {
   
   // MARK: Properties
   var rating = 0 {
      didSet {
         //property observer, triggers a layout
         setNeedsLayout()
      }
   }
   
   var ratingButtons = [UIButton]()
   var spacing = 5
   var stars = 5

   // MARK: Initialization
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
      
      let filledStarImage = UIImage(named: "filledStar")
      let emptyStarImage = UIImage(named: "emptyStar")
      
      for _ in 0..<stars {
         let button = UIButton()
         button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
         button.setImage(emptyStarImage, forState: .Normal)
         button.setImage(filledStarImage, forState: .Selected)
         button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
         //turn off any additional highlight
         button.adjustsImageWhenHighlighted = false
         
         ratingButtons += [button]
         addSubview(button)
      }
   }
   
   override func intrinsicContentSize() -> CGSize {
      let buttonSize = Int(frame.size.height)
      let width = (buttonSize + spacing) * stars
      
      return CGSize(width: width, height: buttonSize)
   }
   
   override func layoutSubviews() {
      let buttonSize = Int(frame.size.height)
      var buttonFrame = CGRect(x: 0, y:0, width: buttonSize, height: buttonSize)
      
      //offset each button origin by the lenght of the button plus spacing
      for (index, button) in ratingButtons.enumerate() {
         buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
         button.frame = buttonFrame
      }
      
      updateButtonSelectionStates()
   }
   
   
   
   // MARK: Button Action
   func ratingButtonTapped(button: UIButton) {
      rating = ratingButtons.indexOf(button)! + 1
      updateButtonSelectionStates()
   }
   
   func updateButtonSelectionStates() {
      for (index, button) in ratingButtons.enumerate() {
         //if the index of the button is less than the rating then set selected
         button.selected = index < rating
      }
   }
}
