//
//  ContentView.swift
//  hw_4_MasterListApp
//
//  Created by Ertuğrul Akkaya on 3.09.2025.
//

import SwiftUI

struct ContentView: View {

    // MARK: PROPERTIES

    @State private var items: [ListItem] = ListItem.sampleData
    
    @State private var themeColor : Color = .blue
    
    @State private var showAlternativeLayout = false
    
    var todoItems: [ListItem] {
        items.filter { !$0.isCompleted }
    }

    var completedItems: [ListItem] {
        items.filter { $0.isCompleted }
    }

    var body: some View {
        NavigationView {
            
            
            VStack{
                if showAlternativeLayout {
                   AlternativeScrollView(todoItems: todoItems, completedItems: completedItems)
                }else {
                    StandardListView(todoItems: todoItems, completedItems: completedItems, deleteAction: deleteItem)
                }
            }
    
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                     
                        let newItem = ListItem(title: "New Food Item", description: "Food item description", isCompleted: false)
                        
                        items.insert(newItem, at: 0)
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                     
                        showAlternativeLayout.toggle()
                    }) {
                        Image(systemName: showAlternativeLayout ?  "list.bullet" : "square.grid.2x2")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(Text("Master List"))
        }
        .onAppear{
            let colorPalette : [Color] = [.red, .gray ,.green, .orange, .purple, .pink, .indigo]
            self.themeColor = colorPalette.randomElement() ?? .blue
        }
        .accentColor(themeColor)
    

    }
    
    func deleteItem(at offsets: IndexSet, from sourceArray: [ListItem]){
        let itemsToDelete = offsets.map { sourceArray[$0] }
        items.removeAll {item in
                itemsToDelete.contains(where: { $0.id == item.id })
        }
    }
}

#Preview {
    ContentView()
}
