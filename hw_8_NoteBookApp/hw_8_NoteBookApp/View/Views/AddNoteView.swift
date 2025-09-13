//
//  AddNoteView.swift
//  hw_8_NoteBookApp
//
//  Created by Ertuğrul Akkaya on 13.09.2025.
//

import SwiftUI

struct AddNoteView: View {
    
    @State private var title : String = ""
    @State private var content : String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var viewmodel : NoteViewModel
    
         var body: some View {
             NavigationView {
                 Form {
    TextField("Title", text: $title)
    
                     // ZStack, elemanları üst üste bindirir.
                     ZStack(alignment: .topLeading) {
                         // TextEditor boşsa, arkadaki bu placeholder görünür.
                         if content.isEmpty {
                             Text("Write new note...")
                                 .foregroundColor(Color(.placeholderText))
                                 .padding(.top, 8)
                                 .padding(.leading, 5)
                         }
    
                         // Çok satırlı metin editörü
                         TextEditor(text: $content)
                             .frame(minHeight: 200) // Minimum yükseklik verelim.
                     }
                 }
                 .navigationTitle("Add new note")
                 .navigationBarTitleDisplayMode(.inline)
                 .navigationBarItems(
                    leading: Button("Cancel") {
                         presentationMode.wrappedValue.dismiss()
                     },
                     trailing: Button("Save") {
                         viewmodel.addNote(title: title, content: content)
                         presentationMode.wrappedValue.dismiss()
                     }
                     .disabled(title.isEmpty)
                 )
             }
         }
     }


#Preview {
    AddNoteView(viewmodel: NoteViewModel())
}
