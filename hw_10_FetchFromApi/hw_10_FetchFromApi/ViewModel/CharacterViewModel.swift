//
//  CharacterViewModel.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 20.09.2025.
//

import Foundation

@MainActor
class CharacterViewModel : ObservableObject{
    
    @Published var characters: [Character] = []
    @Published var errorMessage : String? = nil
    
    @Published var searchText: String = ""
    
    func fetchCharacters() async  {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        do {
           let (data, _) =  try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            self.characters = decodedResponse.results
       
            
        }catch {
            self.errorMessage = "Data could not be loaded: \(error.localizedDescription)"
        }
        
        
        
    }
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty{
            return characters
        }else {
            return characters.filter { character in
                return character.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
