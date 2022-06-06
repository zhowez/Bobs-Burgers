//
//  Character_View.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/1/22.
//

import SwiftUI

struct Response: Codable {
    var result: Result
}

struct Result: Codable {
    var id: Int
    var name: String
    var image: String
    var gender:String
    var hairColor:String
    var occupation:String
    var firstEpisode:String
    var voicedBy:String
    var url:String
    var wikiUrl:String
    
    init() {
        id = -1
        name = "N/A"
        image = "N/A"
        gender = "N/A"
        hairColor = "N/A"
        occupation = "N/A"
        firstEpisode = "N/A"
        voicedBy = "N/A"
        url = "N/A"
        wikiUrl = "N/A"
    }
    
}

struct CharacterView: View {
    @State private var result = Result()
    
    var body: some View {
        
        VStack(alignment: .center){
            Spacer()
            HStack(alignment: .center) {
                Spacer()
            
                AsyncImage(url: URL(string: result.image),
                           content: { image in image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                }).clipShape(RoundedRectangle(cornerRadius: 100)).frame(minWidth: 200,maxWidth: 200, minHeight: 250,maxHeight:  250, alignment: .leading)
                Spacer().frame(minWidth: 20, idealWidth: 20,maxWidth: 20)
                               
                VStack(alignment: .leading){
                    Text("Name: " + result.name).bold().underline().font(.title)
                    Spacer().frame(width: 0, height: 5)
                    Text("Character Info:").font(.title2).bold()
                    Text("Hair Color: " + result.hairColor)
                    Text("Gender: " + result.gender)
                    Text("Occupation: " + result.occupation).truncationMode(.tail)
                    Spacer().frame(width: 0, height: 5)
                    Text("Actor Info:").font(.title2).bold()
                    Text("First Episode: " + result.firstEpisode)
                    Text("Voiced by: " + result.voicedBy)
                    
                }
                Spacer()
            
            }
            Spacer().frame(minHeight: 20, idealHeight: 20,maxHeight: 20)
            
            Button(action: {
                Task {
                    await loadData()
                }
            }, label: {
                Text("Click Me")
            })
            Spacer()
        }
        .task {
            await loadData()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func loadData() async {
        let randoInt = Int.random(in: 1...502)
        guard let url = URL(string: "https://bobsburgers-api.herokuapp.com/characters/\(randoInt)") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession(configuration: .ephemeral).data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Result.self, from: data) {
                result = decodedResponse
            }
            
            
        } catch {
            print("Invalid data")
        }
        
        print(result)
        
    }
}



struct Character_View_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
