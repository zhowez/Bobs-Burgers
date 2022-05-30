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
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: result.image))
                .frame(width: 100, height: 100)
            Text(result.name).font(.headline)
            Text(result.gender)
                    }
        .task {
           await loadData()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://bobsburgers-api.herokuapp.com/characters/127") else {
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
