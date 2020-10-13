//
//  AddRecipeView.swift
//  Recipes
//
//  Created by Rachel Brauner Buchanan on 5/28/20.
//  Copyright © 2020 Rachel Brauner Buchanan. All rights reserved.
//

import SwiftUI
import CoreData

struct AddRecipeView: View {
    
    @State var recipeName: String = ""
    @State var ingredients: String = ""
    @State var directions: String = ""
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    func saveRecipe() {
        let newRecipe = Recipe(context: self.context)
        newRecipe.name = recipeName
        newRecipe.ingredients = ingredients
        newRecipe.directions = directions
        
        do{
            try self.context.save()
        }
        catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack{
            TextField("Recipe Name", text: $recipeName)
            Spacer()
            TextField("Ingredients", text: $ingredients)
            Spacer()
            TextField("Directions", text: $directions)
            Spacer()
            Button(action: saveRecipe) {
                Image(systemName: "plus.circle")
            }
            Spacer()
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
