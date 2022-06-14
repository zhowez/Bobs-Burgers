//
//  character.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/13/22.
//

import Foundation


struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
    let gender:String
    let hairColor:String
    let occupation:String
    let firstEpisode:String
    let voicedBy:String
    let url:String
    let wikiUrl:String
    
}
