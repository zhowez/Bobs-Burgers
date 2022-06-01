//
//  ContentView.swift
//  Bobs_Burgers
//
//  Created by Zach Howes on 5/29/22.
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
        name = " "
        image = " "
        gender = " "
        hairColor = " "
        occupation = " "
        firstEpisode = " "
        voicedBy = " "
        url = " "
        wikiUrl = " "
    }
    
}

struct ContentView: View {
    @State private var result = Result()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            AsyncImage(url: URL(string: result.image),
                       content: { image in image.image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth:100,maxWidth: 100, minHeight:175, maxHeight: 175)
            })
            
            VStack(alignment: .leading){
                Text(result.name).bold().underline().font(.title)
                Spacer().frame(width: 0, height: 5)
                Text("Character Info:").font(.title2).bold()
                Text(result.hairColor)
                Text(result.gender)
                Text(result.occupation)
                Spacer().frame(width: 0, height: 5)
                Text("Actor Info:").font(.title2).bold()
                Text(result.firstEpisode)
                Text(result.voicedBy)
                
            }
            
            Button(action: {
                            Task {
                await loadData()
            }
                        }, label: {
                            Text("Click Me")
                        })
            Spacer().frame(width: 0, height: 20)
        }
        .task {
            await loadData()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func loadData() async {
        let randoInt = Int(arc4random_uniform(502) + 1)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
