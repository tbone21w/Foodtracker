//
//  Meal.swift
//  Foodtracker
//
//  Created by Todd Isaacs on 1/18/16.
//  Copyright © 2016 Todd Isaacs. All rights reserved.
//

import UIKit

class Meal {
   // MARK: Properties
   
   var name: String
   var photo: UIImage?
   var rating: Int
   
   // MARK: Initilization
   init?(name: String, photo: UIImage?, rating: Int) {
      self.name = name
      self.photo = photo
      self.rating = rating
      
      //fail if there is no name or invalid rating
      if name.isEmpty || rating < 0 {
         return nil
      }
   }
   
}