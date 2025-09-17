//
//  NotesViewModel.swift
//  hw_9_CoreData
//
//  Created by Ertuğrul Akkaya on 16.09.2025.
//

import Foundation
import CoreData
import Combine


class NotesViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchNotes()
    }
    
    func fetchNotes() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.date, ascending: false)]
        
        do {
            notes = try context.fetch(request)
        } catch {
            print("Error: \(error)")
        }
    }
    
    
    func addNote(title : String, content : String){
        
        let newNote = Note(context: context)
        newNote.id = UUID()
        newNote.title = title
        newNote.content = content
        newNote.date = Date()
        
        saveContext()
    }
    
    
    func deleteNote(note: Note){
        context.delete(note)
        saveContext()
        
    }
    
    func updateNote(note : Note , newTitle : String, newConent : String){
        note.title = newTitle
        note.content = newConent
        saveContext()
    }
    
    func saveContext(){
        do{
            try context.save()
            fetchNotes()
        }catch{
            print("An error occured while saving context \(error)")
        }
    }
    
}
