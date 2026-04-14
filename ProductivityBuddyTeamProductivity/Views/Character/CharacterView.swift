//
//  CharacterView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Xander Lollis on 3/4/26.
//

import SwiftUI


struct CharacterView: View {
    
    @EnvironmentObject var viewModel:BuddyViewModel //Whole app should now have shared points, cosmetics, and equpped items
    
    var body: some View {
            NavigationStack {
                VStack(spacing: 25) {
                    
                    Text("Productivity Buddy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Points display
                    Text("Points: \(viewModel.points)")
                        .font(.title2)
                        .foregroundColor(.green)
                    
                    // Placeholder teddy bear
                    ZStack {
                        Circle()
                            .fill(Color.brown.opacity(0.3))
                            .frame(width: 200, height: 200)
                        
                        Text("Bear")
                            .font(.system(size: 80))
                    }
                    
                    // Accessories placeholder, I am still extremely uncertain of how this will work
                    VStack(spacing: 10) {
                        Text("Accessories")
                            .font(.headline)
                        
                        HStack(spacing: 20) {
                            accessorySlot("acc1")
                            accessorySlot("acc2")
                            accessorySlot("acc3")
                        }
                    }
                    
                    // Navigation Buttons
                    VStack(spacing: 15) {
                        
                        NavigationLink("Add Task") {
                            //Text("Add Task Page Coming Soon") //Placeholder until AddTaskView.swift is ready
                            AddTaskView()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        NavigationLink("Cosmetics Shop") {
                            ShopView()                        }
                        .buttonStyle(.bordered)
                        
                        NavigationLink(destination: MainMenuView()) {
                            Text("Home")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }

    func accessorySlot(_ icon: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 70, height: 70)
            
            Text(icon)
                .font(.largeTitle)
    }
}

#Preview {
    CharacterView()
}
