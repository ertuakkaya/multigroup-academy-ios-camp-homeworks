//
//  NoteDetailView.swift
//  hw_8_NoteBookApp
//
//  Created by Ertuğrul Akkaya on 13.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        ScrollView(){
            
            
            VStack(alignment: .leading, spacing: 15){
                Text(note.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(note.date,style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                
                Text(note.content)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Note Detail")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

#Preview {
    NoteDetailView(note: Note(id: UUID(), title: "sfdfds", content: "dsfdsfsdf", date: Date()))
}
