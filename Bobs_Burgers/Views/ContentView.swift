//
//  ContentView.swift
//  Bobs_Burgers
//
//  Created by Zach Howes on 5/29/22.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var burgerApp: BurgerApp
    @SceneStorage("charID") var charID = Int.random(in: 0...502)
  
    
    var character: Character  {
        burgerApp.getData(id: charID)
    }
   
    
  
    
    var body: some View {
        VStack{
            TitleView()
            Text(character.name).frame(width: 200, height: 200, alignment: .center)
            ButtonView(id: $charID)
           
        }
       
    }
    

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
