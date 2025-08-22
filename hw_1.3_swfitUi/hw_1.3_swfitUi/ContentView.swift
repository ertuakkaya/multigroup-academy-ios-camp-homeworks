//
//  ContentView.swift
//  hw_1.3_swfitUi
//
//  Created by Ertuğrul Akkaya on 22.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack (
            alignment: .top
        ){
            // BG
            LinearGradient(
                gradient:  Gradient(colors: [Color.blue, Color.red]),
                startPoint: .topLeading ,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack (
                alignment : .center,
                spacing: 30
            ){
                
                // Header
                HeaderView()
                
                // Info Cards
                InfoCardView()
                
                
                // About Me
                AboutMeView()
                
                
                // Buttons
                ButtonsView()
                
                
            }
            .padding(.horizontal , 40)
            
            
        }
        
        
    }
}


struct HeaderView: View {
    var body: some View {
        
        VStack(
            alignment : .center,
            spacing: 10
        ){
            Image("aragorn")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120,height: 120)
                .clipShape(Circle())
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 4))
                .shadow(radius: 10)
                .padding(.top, 50)
            
            Text("Ertuğrul Akkaya")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,8)
            
            Text("Android Developer | SwiftUI Learner ")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            
            
        }
        
        
    }
}

struct InfoCardView: View {
    var body: some View {
        
        HStack(
            spacing: 40,
        ){
            
            VStack{
                Text("Followers")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("0")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            VStack{
                Text("Follow")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("0")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            VStack{
                Text("Like")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("0")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            
        }
        
        
    }
}

struct AboutMeView: View {
    var body: some View {
        VStack{
            Text("I’m a Junior Android Developer with a solid foundation in .NET and PostgreSQL. Currently, I’m expanding my skill set by learning SwiftUI to strengthen my cross-platform development abilities. Passionate about building user-friendly applications and continuously improving my technical expertise.")
                .multilineTextAlignment(.center)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

struct ButtonsView: View {
    var body: some View {
        
        HStack(
            spacing : 60
        ){
            Button {
                
            } label: {
                VStack(
                    spacing : 5
                ){
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.primary)
                        .imageScale( .large)
                    
                    Text("Send Message")
                        .foregroundColor(.primary)
                }
            }
            
            Button {
                
            } label: {
                VStack(
                    spacing : 5
                ){
                   
                    Image(systemName: "heart.fill")
                        .foregroundColor(.primary)
                        .imageScale( .large)

                    
                    Text("Follow")
                        .foregroundColor(.primary)
                }
                
                
            }
        }
        .padding(.top,50)
       
      

    }
}

#Preview {
    HeaderView()
}

#Preview {
    ContentView()
}
