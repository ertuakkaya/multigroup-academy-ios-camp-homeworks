//
//  ErrorView.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 20.09.2025.
//

import SwiftUI

struct ErrorView: View {
    
    let  errorMessage: String
    
    var body: some View {
        VStack{
            
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Text(errorMessage)
                .padding()
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    ErrorView(errorMessage: "Error ")
}
