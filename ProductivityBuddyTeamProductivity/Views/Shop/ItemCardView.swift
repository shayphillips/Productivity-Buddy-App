//
//  ItemCardView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 4/14/26.
//

import SwiftUI

struct ItemCardView: View {
    @EnvironmentObject var viewModel: BuddyViewModel
    let item: CosmeticItem
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .opacity(viewModel.isOwned(item) ? 0.3 : 1.0)
            
            if viewModel.isOwned(item) {
                Text("OWNED")
                    .foregroundColor(.gray)
            } else {
                Text("\(item.price)")
                    .bold()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}
