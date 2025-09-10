//
//  EventsViewModel.swift
//  hw_6_FromsModelsDetailsFlowApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import SwiftUI

class EventsViewModel : ObservableObject{
    
    @Published  var events : [Event] = []
    
    init() {
        // some mock events
        events = [
            
            Event(title: "Multigroup SwfitUI", date: Date(), type: .meeting, hasReminder: true),
            Event(title: "Jetpack Compose", date: Date(), type: .birthDay, hasReminder: false),
            Event(title: "UIKit", date: Date(), type: .other, hasReminder: true),
            Event(title: "View / XML", date: Date(), type: .meeting, hasReminder: false),
            Event(title: "Retrofit", date: Date(), type: .meeting, hasReminder: true),
            Event(title: "Dagger/Hilt", date: Date(), type: .sport, hasReminder: false),
            Event(title: "Ktor", date: Date(), type: .meeting, hasReminder: true),
            Event(title: "Kotlin Multiplatform", date: Date(), type: .holiday, hasReminder: false),
            
            
        ]
        
        
    }
    
    
    func addEvent(title : String, date : Date , type : EventType , hasReminder : Bool){
        
        let newEvent = Event(title: title, date: date, type: type, hasReminder: hasReminder)
        events.append(newEvent)
        
    }
    
    func deleteEvent(at offSets: IndexSet){
        
        events.remove(atOffsets: offSets)
        
    }
    
    func deleteEvent(which event : Event) {
        events.removeAll{  $0.id == event.id}
    }
    
}
