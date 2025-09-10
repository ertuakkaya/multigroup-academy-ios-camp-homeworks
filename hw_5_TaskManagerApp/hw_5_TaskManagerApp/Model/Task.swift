//
//  Task.swift
//  hw_5_TaskManagerApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import Foundation

struct Task : Identifiable {
    
    let id = UUID()
    let title : String
    var isCompleted : Bool
    
    
}
