//
//  Event.swift
//  hw_6_FromsModelsDetailsFlowApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import Foundation

struct Event : Identifiable{
    
    let id : UUID = UUID()
    var title : String
    var date : Date
    var type : EventType
    var hasReminder : Bool
    
}


enum EventType: String, CaseIterable{
    
    case birthDay = "Doğum Günü"
    case meeting = "Toplantı"
    case holiday = "Tatil"
    case sport = "Spor"
    case other = "Diğer"
    
    
    
}
