//
//  EventDetailView.swift
//  hw_6_FromsModelsDetailsFlowApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    
    @Binding var event: Event
    @ObservedObject var viewModel: EventsViewModel
    @Environment(\.dismiss  ) var dissmiss
    
    var body: some View {
        
        
    
        List{
            
            Section(header: Text("Event Informations")) {
                
                LabeledContent("Event Name", value: event.title)
                LabeledContent("Event Date", value: event.date.formatted(date: .long, time: .shortened))
                
                LabeledContent("Event Type", value: event.type.rawValue)
                
            
                
                Toggle("Event Reminder", isOn: $event.hasReminder)
                
                
                
                
                
            }
            
            
            Section {
                
                Button(role: .destructive){
                    viewModel.deleteEvent(which: event)
                    dissmiss()
                } label: {
                    Text("Delete Event")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
                
            }
            
            
            
            
            
        }
        .navigationTitle("Event Detail")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
        
    }
}

