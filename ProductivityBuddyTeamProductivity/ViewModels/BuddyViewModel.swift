//
//  BuddyViewModel.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 4/1/26.
//

import SwiftUI
import Combine

class BuddyViewModel: ObservableObject{
    @Published var buddy = Buddy()
    @Published var points: Int = 250 // change to be whatever amount player has
    
    //Shop Items
    //This is where you add new items
    @Published var shopItems: [CosmeticItem] = [
        CosmeticItem(name: "Crown", category: .body, imageName: "CItem_Crown", price:200),
        CosmeticItem(name: "Sunglasses", category: .body, imageName: "CItem_Sunglasses", price:200)
    ]
    func purchaseItem(_ item: CosmeticItem) {
        print("Buying \(item.name)")
        guard points >= item.price else { return }
        guard !isOwned(item) else { return }
        
        points -= item.price
        buddy.buddyCosmetics.insert(item)
        print("Owned now:", buddy.buddyCosmetics.map { $0.name})
    }
    
    func equipitem(_ item: CosmeticItem) {
        guard isOwned(item) else { return }
        buddy.buddyCosmeticsActive[item.category] = item
    }
    
    func unequipItem(category: CosmeticCategory) {
        buddy.buddyCosmeticsActive.removeValue(forKey: category)
    }
    
    func isOwned(_ item: CosmeticItem) -> Bool {
        let result = buddy.buddyCosmetics.contains(item)
        print("checking: ", item.name)
        print("Owned list: ", buddy.buddyCosmetics.map{ $0.name})
        print("Is owned:", result)
        return result
    }
    
    func isEquipped(_ item: CosmeticItem) -> Bool {
        buddy.buddyCosmeticsActive[item.category] == item
    }
}
