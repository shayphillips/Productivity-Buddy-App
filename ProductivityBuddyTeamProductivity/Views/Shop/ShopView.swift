//
//  ShopView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 4/14/26.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var viewModel: BuddyViewModel
    @State private var selectedItem: CosmeticItem?
    
    var body: some View {
        VStack {
            Text("SHOP")
                .font(.largeTitle)
                .bold()
            
            Text("Your Points: \(Points.shared.value)")
                .font(.headline)
            
            ScrollView {
                ForEach(CosmeticCategory.allCases, id: \.self) {
                    category in
                    
                    VStack(alignment: .leading) {
                        Text(category.rawValue.uppercased())
                            .font(.title2)
                            .bold()
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]) {
                            ForEach(viewModel.shopItems.filter {$0.category == category }, id: \.id) { item in
                                
                                ItemCardView(item: item)
                                    .onTapGesture{
                                        selectedItem = item
                                    }
                        }
                    }
                }
                    .padding()
            }
        }
    }
        .sheet(item: $selectedItem) { item in
            ShopDetailView(item: item)
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    ShopView()
        .environmentObject(BuddyViewModel())
}
