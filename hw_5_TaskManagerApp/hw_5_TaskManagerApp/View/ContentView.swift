//
//  ContentView.swift
//  hw_5_TaskManagerApp
//
//  Created by Ertuğrul Akkaya on 10.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView{
            
            VStack{
                List{
                    ForEach(viewModel.tasks){ task in
                       
                        
                        HStack{
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                            
                            Spacer()
                            
                            
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    viewModel.toggleCompletion(for: task)
                                }
                            
                            
                        }
                        
                        
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
                .navigationBarTitle("Task Manager")
                
                HStack{
                    TextField("New Task", text: $newTaskTitle)
                    Button(action: {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                        
                    }){
                        Text("Add")
                    }
                }
                .padding( 20)
                
            }
            
           
            
        }
    }
}

#Preview {
    ContentView()
}
