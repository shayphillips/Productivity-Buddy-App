//
//  MainMenuView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Productivity Buddy")
                    .font(.largeTitle)
                    .bold()
                
                Divider()
                
                
            }
            .padding()
            .navigationTitle("Main Menu")
        }
    }
}
