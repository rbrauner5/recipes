//
//  Recipe+CoreDataProperties.swift
//  Recipes
//
//  Created by Rachel Brauner Buchanan on 9/21/20.
//  Copyright © 2020 Rachel Brauner Buchanan. All rights reserved.
//

import Foundation
import CoreData

extension Recipe {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }
    
        @NSManaged public var name: String?
        @NSManaged public var ingredients: String?
        @NSManaged public var directions: String?
}

