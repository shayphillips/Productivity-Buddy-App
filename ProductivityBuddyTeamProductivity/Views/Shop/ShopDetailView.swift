//
//  ShopDetailView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 4/14/26.
//

import SwiftUI

struct ShopDetailView: View {
    @EnvironmentObject var viewModel: BuddyViewModel
    let item: CosmeticItem
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item.name.uppercased())
                .font(.title)
                .bold()
            
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text("\(item.price)")
                .font(.title2)
            
            Text("Owned? \(viewModel.isOwned(item) ? "YES" : "NO")")
            
            if !viewModel.isOwned(item) {
                Button("BUY") {
                    viewModel.purchaseItem(item)
                }
                .buttonStyle(.borderedProminent)
            } else if !viewModel.isEquipped(item) {
                        Button("EQUIP") {
                viewModel.equipitem(item)
            }
                .buttonStyle(.borderedProminent)
            } else {
                Text("EQUIPPED")
                    .foregroundColor(.green)
            }
            Button("Close") {
                dismiss()
            }
        }
        .padding()
    }
}
