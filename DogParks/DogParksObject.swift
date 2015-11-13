//
//  DogParksObject.swift
//  DogParks
//
//  Created by David Gudeman on 11/12/15.
//  Copyright (c) 2015 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class DogParksObject: NSManagedObjectContext {
  
  @NSManaged var dogParkNames : String!
  @NSManaged var dogParkDetails : String!
  @NSManaged var dogParkImages : String!
  
   
}
