//
//  hw_9_CoreDataApp.swift
//  hw_9_CoreData
//
//  Created by Ertuğrul Akkaya on 16.09.2025.
//

import SwiftUI

@main
struct hw_9_CoreDataApp: App {
    
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeScreen(context: persistenceController.container.viewContext)
               
        }
    }
}
