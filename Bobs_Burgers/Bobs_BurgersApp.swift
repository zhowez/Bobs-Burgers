//
//  Bobs_BurgersApp.swift
//  Bobs_Burgers
//
//  Created by Zach Howes on 5/29/22.
//

import SwiftUI

@main
struct Bobs_BurgersApp: App {
    
    @StateObject var burgerApp = BurgerApp()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(burgerApp)
            
        }
    }
}
