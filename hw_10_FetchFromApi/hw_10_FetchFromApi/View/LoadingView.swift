//
//  LoadingView.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 20.09.2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center){
            ProgressView()
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
