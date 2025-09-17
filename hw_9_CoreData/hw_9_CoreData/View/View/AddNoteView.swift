//
//  AddNoteView.swift
//  hw_9_CoreData
//
//  Created by Ertuğrul Akkaya on 17.09.2025.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel : NotesViewModel
    
    @State private var title : String = ""
    @State private var content : String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView{
            
            Form{
                Section(header: Text("Note Details")){
                    
                    
                    TextField("Title", text: $title)
                    
                    VStack(alignment: .leading){
                        Text("Content").font(.caption).foregroundColor(.gray)
                        
                        TextEditor(text: $content)
                            .frame(height: 200)
                    }
                }
            }
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        if !title.isEmpty{
                            viewModel.addNote(title: title, content: content)
                            
                            dismiss()
                        }
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                
            }
        }
        
        
    }
}

#Preview {
    AddNoteView(viewModel: NotesViewModel(context: PersistenceController.preview.container.viewContext))
}
