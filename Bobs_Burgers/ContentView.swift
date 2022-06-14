//
//  ContentView.swift
//  Bobs_Burgers
//
//  Created by Zach Howes on 5/29/22.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var burgerApp: BurgerApp
    
//    var character: Character {
//        burgerApp.characters[burgerApp.characters.keys.randomElement()!]
//    }
    
    var body: some View {
    
        Text(character.name)
  
       
    }
    

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
