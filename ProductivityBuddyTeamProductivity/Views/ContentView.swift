//
//  ContentView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/4/26.
//

import SwiftUI
import Combine

// View (Frontend)
struct ContentView: View {
    
    @StateObject var viewModel = AppViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
