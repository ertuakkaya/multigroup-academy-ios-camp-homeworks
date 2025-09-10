//
//  ContentView.swift
//  hw_6_FromsModelsDetailsFlowApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = EventsViewModel()
    @State private var isShowingAddEventSheet: Bool = false
    
    
    var body: some View {
        NavigationStack {
            
            List {
                
                ForEach($viewModel.events){ $event in
                    NavigationLink(destination: EventDetailView(event: $event, viewModel: viewModel)){
                        VStack(alignment : .leading){
                            
                            Text(event.title)
                                .font(.headline)
                            Text(event.date, style: .date)
                                .font(.subheadline)
                            Text(event.type.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                        }
                    }
                    
                    
                }
                .onDelete(perform: viewModel.deleteEvent)
                
            }
            .navigationTitle("Events")
            .toolbar{
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isShowingAddEventSheet = true
                        
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            
            
        }
        .sheet(isPresented: $isShowingAddEventSheet){
            AddEventView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
