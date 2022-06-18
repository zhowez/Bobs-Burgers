//
//  ContentView.swift
//  Bobs_Burgers
//
//  Created by Zach Howes on 5/29/22.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var burgerApp: BurgerApp
  
    
    var character: Character  {
        burgerApp.getData()
    }
   
    
  
    
    var body: some View {
        VStack{
            TitleView()
            Text(character.name).frame(width: 200, height: 200, alignment: .center)
            ButtonView()
           
        }
       
    }
    

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
