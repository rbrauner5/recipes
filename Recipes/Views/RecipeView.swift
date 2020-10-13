//
//  RecipeView.swift
//  Recipes
//
//  Created by Rachel Brauner Buchanan on 7/1/20.
//  Copyright © 2020 Rachel Brauner Buchanan. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.name ?? "NAME")
            Text(recipe.ingredients ?? "INGREDIENTS")
            Text(recipe.directions ?? "DIRECTIONS")
        }
        
    }
}

//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
