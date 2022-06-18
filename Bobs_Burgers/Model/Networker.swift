//
//  Networker.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/13/22.
//

import Foundation


enum FetchError: Error {
  case badURL
  case badResponse
  case badJSON
}


enum Networker {
    static func getDataFroCharacter(Id: Int) async throws -> Character {
        let address = "https://bobsburgers-api.herokuapp.com/characters/\(Id)"
        guard let url = URL(string: address) else {
            throw FetchError.badURL
        }
        let request = URLRequest(url: url)
        let (data, res) = try await URLSession.shared.data(for: request)
        guard let res =  res as? HTTPURLResponse, res.statusCode < 400 else {
            throw FetchError.badResponse
        }
        
        guard let character = try? JSONDecoder().decode(Character.self, from: data) else {
            if let debugString = String(data: data, encoding: .utf8) {
                print(debugString)
                print("This is it")
                
            }
            throw FetchError.badJSON
        }
        
        return character
    }
}
