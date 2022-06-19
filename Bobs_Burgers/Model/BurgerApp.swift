//
//  Model.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/13/22.
//

import Foundation

class BurgerApp: ObservableObject{
    @Published var characters: [Character] = []
    
    @Published var loadingError = false
    @Published var isLoading = true
    
    init() {
        Task {
            await getCharacters()
          
        }
    }
//
//    @MainActor func getRandomCharacter() async {
//        let rando = Int.random(in: 1...502)
//        //print(rando)
//        await getCharacter(rando: rando)
//    }
    
    @MainActor func getCharacters() async {
        print("get Chars")
        loadingError = false
        
        isLoading = true
        defer {
            isLoading = false
        }
        
        
        do {
            let newCharacters = try await Networker.getDataForCharacters()
            characters = newCharacters
        } catch {
            loadingError = true
            print("There was a loading error")
            print(error)
        }
    }
    
    
    func getData(id: Int) -> Character {
        print("Chewie punch it!")
        //use is loading to stop extra reloads
        if (!isLoading) {
            return characters[id]
        }
        
        return Character.error()
        
    }
}
