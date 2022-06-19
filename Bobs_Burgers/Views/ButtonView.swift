//
//  ButtonView.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/18/22.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var burgerApp: BurgerApp
    @Binding var id: Int
    
    
    var body: some View {
        HStack {
            Button(action: {
                   //do action
                weClickedIt()
            }) {
                Image("burger").frame(width: 50, height: 50, alignment: .center)
                    //You need to change height & width as per your requirement
            }.buttonStyle(PlainButtonStyle()).padding()

         
        }
       
}
    
    func weClickedIt() {
        id = Int.random(in: 0...502)
    }
    

}

