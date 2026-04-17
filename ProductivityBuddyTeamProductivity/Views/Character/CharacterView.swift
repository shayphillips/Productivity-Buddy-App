//
//  CharacterView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Xander Lollis on 3/4/26.
//

import SwiftUI


struct CharacterView: View {
    
    @EnvironmentObject var viewModel: BuddyViewModel //Whole app should now have shared cosmetics, and equpped items
    @EnvironmentObject var points: Points 
    
    var body: some View {
            NavigationStack {
                VStack(spacing: 20) {
                    
                    Text("Productivity Buddy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Points display
                    Text("Points: \(points.value)")
                        .font(.title2)
                        .foregroundColor(.green)
                    
                    
                    ZStack {
                        Image("Bear_Character")
                            .resizable()
                            .scaledToFill()
                    }
                    
                    // Accessories placeholder, I am still extremely uncertain of how this will work
                    VStack(spacing: 10) {
                        Text("Accessories")
                            .font(.headline)
                        
                        HStack(spacing: 20) {
                            // get from buddyCosmetics set
                            
                            accessorySlot("acc1")
                            accessorySlot("acc2")
                            accessorySlot("acc3")
                        }
                    }
                    
                    // Navigation Buttons
                    VStack(spacing: 15) {
                        
                        NavigationLink("Add Task") {
                             //Placeholder until AddTaskView.swift is ready
                            AddTaskView()
                                .environmentObject(AppViewModel())
                        }
                        .buttonStyle(.borderedProminent)
                        
                        NavigationLink("Cosmetics Shop") {
                            ShopView()
                        }
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

    func accessorySlot(_ image: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 70, height: 70)
            
            Image(image)
                .resizable()
                .scaledToFit()
            
    }
}

#Preview {
    CharacterView()
        .environmentObject(BuddyViewModel())
        .environmentObject(Points.shared)
}
