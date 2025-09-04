//
//  ListItem.swift
//  hw_4_MasterListApp
//
//  Created by Ertuğrul Akkaya on 3.09.2025.
//

import SwiftUI

struct ListItem: Identifiable {
    
    // MARK : Properties
    let id = UUID()
    var title : String
    var description : String
    var isCompleted : Bool = false
    
    static let sampleData : [ListItem] = [
        
        ListItem(title: "Apple", description: "Red fruit", isCompleted: false),
        ListItem(title: "Banana", description: "Yellow fruit", isCompleted: true),
        ListItem(title: "Orange", description: "Orange fruit", isCompleted: false),
        ListItem(title: "Pineapple", description: "Brown fruit", isCompleted: true),
        ListItem(title: "Strawberry", description: "Red fruit" , isCompleted: false),
        ListItem(title: "Blueberry", description: "Blue fruit", isCompleted: true),
        ListItem(title: "Kiwi", description: "Green fruit" ,isCompleted: false),
        ListItem(title: "Lemon", description: "Yellow fruit", isCompleted: true),
        ListItem(title: "Grapes", description: "Purple fruit",isCompleted: false),
        ListItem(title: "Watermelon", description: "Purple fruit", isCompleted: true),
        
    ]
    

}


