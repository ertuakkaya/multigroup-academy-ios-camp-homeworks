//
//  DetailView.swift
//  hw_4_MasterListApp
//
//  Created by Ertuğrul Akkaya on 3.09.2025.
//

import SwiftUI

struct DetailView: View {
    
    let item : ListItem
    
    var body: some View {
        VStack{
            
            let randomSfSymbolName = ["house", "car", "book", "music.note", "tv", "cloud.fill", "moon", "sun", "moon.stars", "sun.max"]
            
            Image(systemName: randomSfSymbolName.randomElement() ?? "house")
                .font(.largeTitle)
                .padding()
            
            Text(item.title)
                .font(.headline)
                .padding()
            
            Text(item.description)
                .padding()
            
            
            
        }
    }
}

#Preview {
    DetailView(item: ListItem.sampleData[0])
}
