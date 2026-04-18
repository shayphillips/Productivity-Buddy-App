//
//  BuddyViewModel.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 4/1/26.
//

import SwiftUI
import Combine

class BuddyViewModel: ObservableObject{
    @EnvironmentObject var points: Points

    
    @Published var buddyCosmetics: Set<CosmeticItem> = []// List of all Cosmetics buddy has unlocked
    @Published var buddyCosmeticsActive: [CosmeticCategory: CosmeticItem] = [:] // List of cometics currently being used.

    //Shop Items
    //This is where you add new items
    @Published var shopItems: [CosmeticItem] = [
        CosmeticItem(name: "Crown", category: .body, imageName: "CItem_Crown", price: 200),
        CosmeticItem(name: "Sunglasses", category: .body, imageName: "CItem_Sunglasses", price: 200)
    ]
    
    func purchaseItem(_ item: CosmeticItem) {
        guard Points.shared.value >= item.price,
              !isOwned(item) else {
            print("Problem buying item")
            return
        }
        
        Points.shared.add(-item.price)
        buddyCosmetics.insert(item)
        print("Purchase Successful! Bought \(item.name)")
        print("Owned items:", buddyCosmetics.map { $0.name})
    }
    
    func equipitem(_ item: CosmeticItem) {
        guard isOwned(item) else { return }
        buddyCosmeticsActive[item.category] = item
    }
    
    func unequipItem(category: CosmeticCategory) {
        buddyCosmeticsActive.removeValue(forKey: category)
    }
    
    func isOwned(_ item: CosmeticItem) -> Bool {
        let result = buddyCosmetics.contains(item)
        return result
    }
    
    func isEquipped(_ item: CosmeticItem) -> Bool {
        buddyCosmeticsActive[item.category] == item
    }
    
}
