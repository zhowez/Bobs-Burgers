//
//  Model.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/13/22.
//

import Foundation

class BurgerApp: ObservableObject{
    @Published var characters: [Int: Character] = [:]
    
    @Published var loadingError = false
    @Published var isLoading = false
    
    init() {
        Task {
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
            await getRandomCharacter()
        }
    }
    
    @MainActor func getRandomCharacter() async {
        let rando = Int.random(in: 1...502)
        //print(rando)
        await getCharacter(rando: rando)
    }
    
    @MainActor func getCharacter(rando: Int) async {
        
        loadingError = false
        
        isLoading = true
        defer {
            isLoading = false
        }
        
        
        if characters[rando] != nil {
            return
        }
        
        do {
            let newCharacter = try await Networker.getDataFroCharacter(Id: rando)
            characters[newCharacter.id] = newCharacter
        } catch {
            loadingError = true
            print("There was a loading error")
            print(error)
        }
    }
    
    
    func getData() -> Character {
        print("Chewie punch it!")
        //use is loading to stop extra reloads
        return characters.randomElement()?.value ?? Character.error()
        
    }
}
