//
//  ButtonView.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/18/22.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var burgerApp: BurgerApp
    var body: some View {
        Text("Test")
        Button(action: {weClickedIt()}, label: {
            Image("burg") .resizable().clipped()
               
        })
       
}
    
    func weClickedIt() {
        Task {
            await burgerApp.getRandomCharacter()
        }
        
        
    }
    

}
