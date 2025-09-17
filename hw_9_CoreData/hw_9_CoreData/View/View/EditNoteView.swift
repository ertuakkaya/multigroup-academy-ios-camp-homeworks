//
//  EditNoteView.swift
//  hw_9_CoreData
//
//  Created by Ertuğrul Akkaya on 17.09.2025.
//

import SwiftUI

struct EditNoteView: View {
    
    @ObservedObject var viewModel : NotesViewModel
    
    let note : Note
    
    @State private var title : String
    @State private var content : String
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) private var viewContext
    
    init(note: Note, viewModel : NotesViewModel) {
        self.note = note
        self.viewModel = viewModel
        _title = State(initialValue: note.title ?? "")
        _content = State(initialValue: note.content ?? "")
    }
    
    var body: some View {
        Form{
            Section(header: Text("Note Details")){
                
                TextField("Title" , text: $title)
                
                VStack(alignment : .leading){
                    
                    Text("Content").font(.caption).foregroundColor(.gray)
                    TextEditor(text: $content)
                        .frame(height: 200)
                    
                }
                
            }
        }
        .navigationTitle("Edit Note")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Save"){
                    viewModel.updateNote(note: note, newTitle: title, newConent: content)
                    dismiss()
                }
            }
        }
    }
    
    
    private func updateNote(){
        note.title = title
        note.content = content
        do{
            try viewContext.save()
        }catch {
            print("Error saving note: \(error)")
        }
        
      
    }
}

#Preview {
    EditNoteView( note: Note(context: .init()), viewModel: .init(context: .init()))
}
