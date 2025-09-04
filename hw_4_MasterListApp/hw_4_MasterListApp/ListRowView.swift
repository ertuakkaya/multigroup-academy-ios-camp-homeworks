//
//  ListRowView.swift
//  hw_4_MasterListApp
//
//  Created by Ertuğrul Akkaya on 3.09.2025.
//

import SwiftUI

struct ListRowView: View {
    let item : ListItem
    
    var body: some View {
        
        HStack{
            Image(systemName: "doc.text" )
                .font(.title2)
                .foregroundColor(.blue)
            
            VStack(
                alignment : .leading,
                spacing: 4
            ){
                Text(item.title)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            Spacer()
            
        }
        .padding(.vertical, 8)
       
    }
}

#Preview {
    ListRowView(item: ListItem.sampleData[0])
}
