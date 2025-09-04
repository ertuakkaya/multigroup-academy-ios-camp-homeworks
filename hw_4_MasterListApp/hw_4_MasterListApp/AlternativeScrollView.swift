//
//  AlternativeScrollView.swift
//  hw_4_MasterListApp
//
//  Created by Ertuğrul Akkaya on 4.09.2025.
//

import SwiftUI

struct AlternativeScrollView: View {
    let todoItems: [ListItem]
    let completedItems: [ListItem]
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment : .leading){
                Text("Tamamlanacaklar")
                    .font(.title2.bold())
                    .padding([.horizontal, .top])
                
                ForEach(todoItems) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        ListRowView(item: item)
                            .padding(.horizontal)
                    }
                    Divider()
                        .padding(.horizontal)

                }
                
                Text("Tamamlananlar")
                    .font(.title2.bold())
                    .padding([.horizontal, .top])
                
                ForEach(completedItems) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        ListRowView(item: item)
                            .padding(.horizontal)
                    }
                    Divider()
                        .padding(.horizontal)

                }
                
                
            }
        }
    }
}

#Preview {
    AlternativeScrollView(
        
        todoItems: ListItem.sampleData.filter{ !$0.isCompleted},
        completedItems: ListItem.sampleData.filter{ !$0.isCompleted},
        
    )
}
