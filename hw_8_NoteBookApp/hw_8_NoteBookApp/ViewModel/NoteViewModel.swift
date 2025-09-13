//
//  NoteViewModel.swift
//  hw_8_NoteBookApp
//
//  Created by Ertuğrul Akkaya on 13.09.2025.
//

import Foundation

//
class NoteViewModel : ObservableObject {
    
    @Published var notes : [Note] = []
    
    init() {
        loadNotes()
    }
    
    func addNote(title : String, content : String) {
        let newNote = Note(id: UUID(), title: title, content: content, date: Date())
        // yeni note'u note array'ine ekle
        notes.insert(newNote, at: 0)
        
        // array'i json'a çevirip UserDefault'a kaydet
        saveNotes()
        
    }
    
    func saveNotes(){
        
        // json encoder'ı initle
        let encoder = JSONEncoder()
        
        do{
            // note'ları json'a çevir
            let encoded = try encoder.encode(notes)
            
            // Userdefaults'a json halindeki note'ları at "notes" keyi ile
            UserDefaults.standard.set(encoded, forKey: "notes")
        }catch {
            print("An error occured while saving notes to UserDefaults")
        }
        
        
    }
    
    
    
    func loadNotes(){
        
        if let savedNotes = UserDefaults.standard.data(forKey: "notes"){
            let decoder = JSONDecoder()
            
            do {
                notes = try decoder.decode([Note].self, from: savedNotes)
            }catch {
                print("An error occured while loading notes from UserDefaults")
            }
        }
    }
    
    func deleteNote(at offsets: IndexSet){
        
       // mevcut notlardan çıkar
        notes.remove(atOffsets: offsets)
        // yeni not halini kaydey.
        saveNotes()
        
    }
}
