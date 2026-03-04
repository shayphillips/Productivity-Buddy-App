//
//  ContentView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/4/26.
//

import SwiftUI

import Combine

struct Task: Identifiable {
//        let categories [String] = ["Misc","Study","Work","Exercise","Hobbies","","None"]
    let id: UUID = UUID()
    var title: String
    var selectedCategory: [String] = [] // (WIP) Select category from categories
    var taskPriority: Int = 0 //Scale from 0 - 3, 0: No Rush, 3: Urgent
    var timeRequired: Int? = 0
    var pointsToAward: Int = 0 //The # of points that are received when task is completed
    var isComplete: Bool = false
    var taskRecurring: Bool = false
    
}

struct Buddy{
    var buddyLevel: Int = 0 //Leveling up your buddy (we can remove if we want to)
    var buddyName: String = "Unknown"
    var buddyCosmetics: [String] = [] // List of all Cosmetics buddy has unlocked
    var buddyCosmeticsActive: [String] = [] // List of cometics currently being used.
}

// View Model (Backend)
class AppViewModel: ObservableObject{
    
    @Published var tasks: [Task] = []
    @Published var myBuddy: Buddy = Buddy()
    
    func addTask(){}
    
    func completeTask(){}
    
    func purchaseItem(){}
    
    func equipItem(){}
    
}

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
