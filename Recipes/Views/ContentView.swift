//
//  ContentView.swift
//  Recipes
//
//  Created by Rachel Brauner Buchanan on 5/28/20.
//  Copyright © 2020 Rachel Brauner Buchanan. All rights reserved.
//

//Text("Cous Cous Avocado Bowl")
//Text("Strogonoff")
//Text("Spaghetti")
//Text("Taco Salad")

import SwiftUI

struct ContentView: View {
        
    @State var recipes: [Recipe]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchRecipes() {
        do {
            self.recipes = try context.fetch(Recipe.fetchRequest())
        }
        catch {
            print("Error fetching recipes")
        }
    }
    
    func deleteRecipes(at offsets: IndexSet) {
        
        guard let recipes = self.recipes else {
            print("Error deleting recipes")
            return
        }
        
        offsets.forEach { offset in
        
            let recipeToRemove = recipes[offset]
            
            self.context.delete(recipeToRemove)
            
            do {
                try self.context.save()
            }
            catch {
                print("Error deleting recipe")
            }
            
            self.fetchRecipes()
        }
            
        self.recipes?.remove(atOffsets: offsets)
        
    }
        
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(self.recipes ?? [], id: \.name) {
                        RecipeView(recipe: $0)
                    
                    }.onDelete(perform: deleteRecipes)
                }
                NavigationLink(destination: AddRecipeView()) {
                    Image(systemName: "plus.circle")
                        .padding()
                        .font(.largeTitle)
                        .accentColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
                }
            }
    }.onAppear(perform: fetchRecipes)
    .navigationBarTitle("Recipes", displayMode: .large)
    .accentColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
