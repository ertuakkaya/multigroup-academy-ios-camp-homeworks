//
//  StandartListView.swift
//  hw_4_MasterListApp
//
//  Created by Ertuğrul Akkaya on 4.09.2025.
//

import SwiftUI

struct StandardListView: View {
    let todoItems: [ListItem]
    let completedItems: [ListItem]
    
    var deleteAction : (IndexSet, [ListItem]) -> Void
    
    
    var body: some View {
        List{

            Section(header: Text("Tamamlanacaklar")) {

                ForEach(todoItems) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        ListRowView(item: item)
                    }

                }
                .onDelete{ offsets in
                    deleteAction(offsets, todoItems)
                }
            }

            Section(header: Text("Tamamlananlar")) {

                ForEach(completedItems) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        ListRowView(item: item)
                    }

                }
                .onDelete{ offsets in
                    deleteAction(offsets, completedItems)
                }
            }

        }
        .listStyle(InsetGroupedListStyle())
    }
}

#Preview {
    StandardListView(
        todoItems: ListItem.sampleData.filter{ !$0.isCompleted},
        completedItems: ListItem.sampleData.filter{ !$0.isCompleted},
        deleteAction: { _,_ in
            print("Delete action called")
        }
    )
}
