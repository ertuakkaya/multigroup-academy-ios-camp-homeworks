//
//  CharacterRowView.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 20.09.2025.
//

import SwiftUI

struct CharacterRowView: View {
    
    let character: Character
    
    var body: some View {
        HStack(spacing : 16){
            
            AsyncImage(url: URL(string: character.image)){image in
                image
                    .resizable()
                    .scaledToFit( )
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))
                
            
            VStack(alignment: .leading){
                Text(character.name)
                    .font(.headline)
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
       // .padding()
    }
}

#Preview {
    CharacterRowView(character: Character(
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
        
    ))
}

let sampleCharacter = Character(
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
