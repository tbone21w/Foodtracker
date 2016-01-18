//
//  FoodtrackerTests.swift
//  FoodtrackerTests
//
//  Created by Todd Isaacs on 1/14/16.
//  Copyright © 2016 Todd Isaacs. All rights reserved.
//

import XCTest
@testable import Foodtracker

class FoodtrackerTests: XCTestCase {
    
    //Mark: FoodTracker Tests
   func testMealInitialization() {
      //Success case
      let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
      XCTAssertNotNil(potentialItem)
      
      //Failure case
      let noName = Meal(name: "", photo: nil, rating: 0)
      XCTAssertNil(noName, "Empty name is invalid")
      
      let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
      XCTAssertNil(badRating)
   }
    
}
