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
        ZStack{
            VStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 300, height: 200)
                    .scaledToFit()
                    .opacity(viewModel.isOwned(item) ? 0.3 : 1.0)
                    .padding(.bottom, 20)

            }
            .frame(width: 100, height: 100)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)

            VStack{
                Spacer()
                if viewModel.isOwned(item) {
                    Text("OWNED")
                        .foregroundColor(.gray)
                } else {
                    Text("\(item.price)")
                        .font(.title2)
                        .bold()
                }
            }
            .frame(width: 100, height: 100)
        }
        
    }
}

#Preview {
    ItemCardView(item: CosmeticItem(name: "Crown", category: .body, imageName: "CItem_Crown", price:200))
        .environmentObject(BuddyViewModel())
}
