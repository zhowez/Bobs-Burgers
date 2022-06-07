//
//  ContentView.swift
//  Bobs_Burgers
//
//  Created by Zach Howes on 5/29/22.
//

import SwiftUI



var set = 0
struct ContentView: View {
    
    
    var body: some View {
        
     
        VStack{
        
            Rectangle().foregroundColor(.yellow).overlay(Text("Bob's Burgers Random Character Generator").font(Font.custom("Bob's Burgers", size: 50))).foregroundColor(.red).frame(width: .infinity, height: 50, alignment: .top)
           
            CharacterView()
            
        
            
            
        }
  
       
    }
    

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
