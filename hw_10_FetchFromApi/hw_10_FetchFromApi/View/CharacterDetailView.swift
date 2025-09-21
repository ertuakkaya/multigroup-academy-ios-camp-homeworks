//
//  CharacterDetailView.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 21.09.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: Character
    
  
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                  
                    ProgressView()
                        .frame(height: 300)
                }

             
                VStack(alignment: .leading, spacing: 15) {
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                    HStack {
                        Text("Status:")
                            .fontWeight(.semibold)
                        Text(character.status)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Species:")
                            .fontWeight(.semibold)
                        Text(character.species)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Gender:")
                            .fontWeight(.semibold)
                        Text(character.gender)
                        Spacer()
                    }
                }
                
                Divider()

                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Origin")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(character.origin.name)
                    
                  
                    Spacer().frame(height: 10)
                    
                    Text("Current Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(character.location.name)
                }
                
                Divider()

              
                HStack {
                    Text("Shown episode count:")
                        .fontWeight(.semibold)
                    Text("\(character.episode.count)")
                    Spacer()
                }
                
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    CharacterDetailView(character:
        
        Character(
            id : 1,
            name : "John Snow",
            status : "Alive",
            species : "Human",
            type : "",
            gender : "Male",
            origin : Origin(
                name: "sdfds", url: "asdsa"
            ),
            location: Location(
                name: "sfds", url: "sadsaf"
            ),
            episode: [],
            url: "",
            created: "",
            image: ""
            
        )
        
    )
}
