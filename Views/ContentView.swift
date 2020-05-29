//
//  ContentView.swift
//  Recipes
//
//  Created by Rachel Brauner Buchanan on 5/28/20.
//  Copyright © 2020 Rachel Brauner Buchanan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                List{
                    Text("Biscuits and Gravy")
                    Text("Cous Cous Avocado Bowl")
                    Text("Strogonoff")
                    Text("Spaghetti")
                    Text("Taco Salad")
                }
                    
                NavigationLink(destination: AddRecipeView()) {
                    Image(systemName: "plus")
                        .font(.title)
                }
                    
            .navigationBarTitle("Recipes", displayMode: .large)
            
            
            
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
