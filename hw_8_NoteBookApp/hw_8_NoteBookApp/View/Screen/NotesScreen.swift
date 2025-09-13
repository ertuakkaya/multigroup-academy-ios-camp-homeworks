//
//  ContentView.swift
//  hw_8_NoteBookApp
//
//  Created by Ertuğrul Akkaya on 13.09.2025.
//

import SwiftUI

struct NotesScreen: View {
    
    @StateObject private var viewModel =  NoteViewModel()
    @State private var showingAddNoteSheet = false
    
    var body: some View {
        NavigationView{
            
            List{
              
                
                ForEach(viewModel.notes){note in
                    
                    NavigationLink(destination: NoteDetailView(note: note)){
                        
                        VStack(alignment : .leading){
                            
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                            
                        }
                        
                        
                    }
                    
                  
                    
                }
                .onDelete(perform: viewModel.deleteNote)
                
            }
            .navigationTitle("My NoteBook")
            .toolbar{
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action: {
                        showingAddNoteSheet = true
                       
                        
                    }){
                        
                        Image(systemName: "plus")
                    }
                }
                
            }
            .sheet(isPresented: $showingAddNoteSheet){
                AddNoteView(viewmodel: viewModel)
            }
           
                                    
        }
        
        
        
        
    }
}

#Preview {
    NotesScreen()
}
