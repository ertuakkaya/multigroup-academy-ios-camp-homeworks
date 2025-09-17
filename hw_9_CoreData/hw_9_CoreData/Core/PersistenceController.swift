//
//  PersistenceController.swift
//  hw_9_CoreData
//
//  Created by Ertuğrul Akkaya on 16.09.2025.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    
    init(inMemory : Bool = false) {
        container = NSPersistentContainer(name: "hw_9_CoreData")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    static var preview : PersistenceController {
        let result = PersistenceController(inMemory : true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Note(context: viewContext)
            newItem.id = UUID()
            newItem.title = "Preview \(i)"
            newItem.content = "Preview conent \(i)"
            newItem.date = Date()
            
        }
        
        do {
            try viewContext.save()
        }catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }
    
}
