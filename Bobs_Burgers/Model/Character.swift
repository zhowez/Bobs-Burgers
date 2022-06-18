//
//  character.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/13/22.
//

import Foundation

struct Character: Codable {
    
    let id: Int
    let name: String
    let image: String
    let gender: String?
    let hairColor: String?
    let occupation: String?
    let firstEpisode: String?
    let voicedBy:String?
    let url:String?
    let wikiUrl:String?
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case image
      case gender
      case hairColor
      case occupation
      case firstEpisode
      case voicedBy
      case url
      case wikiUrl
    }
    
    init(from decoder: Decoder) throws {
         let values = try decoder.container(keyedBy: CodingKeys.self)
         
         id = try values.decode(Int.self, forKey: .id)
         name = try values.decode(String.self, forKey: .name)
         image = try values.decode(String.self, forKey: .image)
         gender = try values.decodeIfPresent(String.self, forKey: .gender)
         hairColor = try values.decodeIfPresent(String.self, forKey: .hairColor)
         occupation = try values.decodeIfPresent(String.self, forKey: .occupation)
         firstEpisode = try values.decodeIfPresent(String.self, forKey: .firstEpisode)
         voicedBy = try values.decodeIfPresent(String.self, forKey: .voicedBy)
         url = try values.decodeIfPresent(String.self, forKey: .url)
         wikiUrl = try values.decodeIfPresent(String.self, forKey: .wikiUrl)
     }
    
    init(name: String, id: Int, image: String, gender: String, hairColor: String, occupation: String, firstEpisode: String, voicedBy: String, url: String, wikiUrl: String) {
          self.name = name
          self.id = id
          self.image = image
          self.gender = gender
          self.hairColor = hairColor
          self.occupation = occupation
          self.firstEpisode = firstEpisode
          self.voicedBy = voicedBy
          self.url = url
          self.wikiUrl = wikiUrl
      }
    
    static func error() -> Character {
            return Character(name: "Error", id: -1, image: "https://static.wikia.nocookie.net/bobsburgerpedia/images/2/2a/Bsbs_Sliding_Bobs_5ASA10-510_14_05_tk1-0023_hires2.jpg/revision/latest?cb=20150829005834", gender: "Error", hairColor: "Error", occupation: "Error", firstEpisode: "Error", voicedBy: "Error", url: "Error", wikiUrl: "Error")
        }
     
    
    
}
