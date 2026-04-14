//
//  MainMenuView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//
// This is the MainMenu View. This is the starting point that the app opens up to and gives users three options, go to their daily tasks, their calender, and their character.

// TO BE IMPLEMENTED: Stylizing, settings view and options(questionable?)
import SwiftUI

struct MainMenuView: View {
    
    @State private var tasks: [Task] = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Productivity Buddy")
                    .font(.largeTitle)
                    .bold()
                
                Divider()
                
                NavigationLink("Daily Tasks") {
                    DailyTasksView(tasks: $tasks, selectedDate: Date())
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Calendar") {
                    CalenderView(tasks: $tasks)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Character"){
                    CharacterView()
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Main Menu")
        }
    }
}

#Preview{
    MainMenuView()
}
