//
//  AddEventView.swift
//  hw_6_FromsModelsDetailsFlowApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import SwiftUI

struct AddEventView: View {
    
    @ObservedObject var viewModel: EventsViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var date = Date()
    @State private var type : EventType = .meeting
    @State private var hasReminder = false
    
    
    var body: some View {
        
        
        NavigationView{
            
            Form{
                
                TextField("Event Name", text : $title)
                
                
                Picker("Type", selection: $type){
                    ForEach(EventType.allCases,id: \.self){ eventType in
                        
                        Text(eventType.rawValue).tag(eventType)
                    }
                }
                
                DatePicker("Date" , selection: $date, displayedComponents: .date)
                
                Toggle("Reminder", isOn: $hasReminder)
                
                
                
            }
            .navigationTitle("New Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    
                    Button("Cancel"){
                        dismiss()
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button("Save"){
                        viewModel.addEvent(title: title, date: date, type: type, hasReminder: hasReminder)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                    
                }
                
                
                
                
            }
            
        }
        
    }
}


