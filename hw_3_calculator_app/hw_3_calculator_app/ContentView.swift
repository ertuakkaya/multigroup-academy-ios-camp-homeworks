//
//  ContentView.swift
//  hw_3_calculator_app
//
//  Created by Ertuğrul Akkaya on 2.09.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.purple,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                
                
                Text("Count \(count)")
                    .font(.largeTitle)
                    .padding()
                
                
                
                HStack(){
                    
                    Button("Decrement"){
                        if count > 0{
                            count -= 1
                        }
                       
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                    Button("Increment"){
                        count += 1
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                   
                    
                }
                
            }
            
            .padding()
        }
        
       
    }
}

#Preview {
    ContentView()
}
