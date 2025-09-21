//
//  ContentView.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 20.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CharacterViewModel()
    var body: some View {
      
        NavigationStack {
            if let errorMessage = viewModel.errorMessage{
                ErrorView(errorMessage: errorMessage)
            }else if viewModel.characters.isEmpty{
                LoadingView()
            }else{
                
                List(viewModel.filteredCharacters){ character in
                    
                    
                    NavigationLink(destination: CharacterDetailView(character: character)){
                        CharacterRowView(character: character)
                    }
                    
                   
                    
                }
                .searchable(text: $viewModel.searchText)
                
                
                
            }
              
        }
        .navigationTitle("Rich & Morty Characters")
        .task {
            await viewModel.fetchCharacters()
        }
        
        
    }
}

#Preview {
    ContentView()
}
