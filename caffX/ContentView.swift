//
//  ContentView.swift
//  caffX
//
//  Created by Avyan Mehra on 19/8/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello World")
            
                .navigationTitle("caffX")
                .navigationBarTitleDisplayMode(.large)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
