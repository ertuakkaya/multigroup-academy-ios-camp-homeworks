//
//  ContentView.swift
//  hw_9_CoreData
//
//  Created by Ertuğrul Akkaya on 16.09.2025.
//

import SwiftUI
import CoreData

struct HomeScreen: View {
    
    
    @StateObject private var viewModel: NotesViewModel
    
    @State private var isShowingAddNoteView = false
    
    @State private var searchText: String = ""
    
    init(context : NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: NotesViewModel(context: context))
    }
    
    var searchResult : [Note] {
        if searchText.isEmpty {
            return viewModel.notes
        }else{
            return viewModel.notes.filter{ note in
                note.title?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
    }
   
    
    var body: some View {
        NavigationView{
          noteList
        }
    }
    
    private var noteList : some View{
        List{
            ForEach(searchResult){note in
                
                NavigationLink(destination: EditNoteView(note : note, viewModel : viewModel)){
                    VStack(alignment : .leading) {
                        Text(note.title ?? "No title")
                            .font(.headline)
                        Text(note.date ?? Date(), style: .date)
                            .font(.caption)
                    }
                }
            }
            .onDelete(perform: { indexSet in
                guard let index = indexSet.first else {return}
                let noteToDelete = viewModel.notes[index]
                viewModel.deleteNote(note: noteToDelete)
            })
        }
        .searchable(text: $searchText, prompt: "Search")
        .onAppear(perform: viewModel.fetchNotes)
        .navigationTitle("Notes")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    isShowingAddNoteView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isShowingAddNoteView){
            AddNoteView(viewModel: viewModel)
        }
    }
}

#Preview {
   HomeScreen(context: PersistenceController.preview.container.viewContext)
}
