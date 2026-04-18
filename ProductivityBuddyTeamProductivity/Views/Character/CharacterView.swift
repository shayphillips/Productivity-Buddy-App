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

    @State private var showAccessories = false
    
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
                        .frame(width: 430, height: 300)
                    
                    if showAccessories {
                        ForEach(Array(viewModel.buddyCosmeticsActive.values), id: \.id) { item in
                            Image("\(item.imageName)_Wearable")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 430, height: 300)
                        }
                    }
                    
                }
            
                
                // Accessories display
                VStack(spacing: 30) {
                    Text("Accessories")
                        .font(.headline)
                        .padding(20)
                    
                    ScrollView{
                        LazyVGrid(columns: [ GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()) ], spacing: 20) {
                            // A slot for every available item in the shop
                            ForEach(viewModel.shopItems, id: \.self) { item in
                                if viewModel.isOwned(item) {
                                    accessorySlot(item.imageName)
                                        .onTapGesture {
                                            showAccessories = true
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                if viewModel.isEquipped(item) {
                                                    viewModel.unequipItem(category: item.category)
                                                } else {
                                                    viewModel.equipitem(item)
                                                }
                                            }
                                        }
                                } else {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 70, height: 70)
                                }
                            }
                        }
                    }
                    .frame(width: 375, height: 100)

                }
                
                Spacer()
                
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
                            .environmentObject(viewModel)
                    }
                    .buttonStyle(.bordered)
           
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
