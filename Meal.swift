//
//  Meal.swift
//  Foodtracker
//
//  Created by Todd Isaacs on 1/18/16.
//  Copyright © 2016 Todd Isaacs. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
   
   // MARK: Properties
   var name: String
   var photo: UIImage?
   var rating: Int
   
   // MARK: Archiving Paths
   static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
   static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
   
   // MARK: Type
   struct PropertyKey {
      static let nameKey = "name"
      static let photoKey = "photo"
      static let ratingKey = "rating"
   }
   
   // MARK: Initilization
   init?(name: String, photo: UIImage?, rating: Int) {
      self.name = name
      self.photo = photo
      self.rating = rating
      
      super.init()
      
      //fail if there is no name or invalid rating
      if name.isEmpty || rating < 0 {
         return nil
      }
   }
   
   // MARK: NSCoding
   func encodeWithCoder(aCoder: NSCoder) {
      aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
      aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
      aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
   }
   
   required convenience init?(coder aDecoder: NSCoder) {
      let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
      let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as! UIImage
      let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
      
      //must call a designated initializer
      self.init(name: name, photo: photo, rating:rating)
   }
   
}