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
    @Published var points: Int = 0 // change to be whatever amount player has
    
    //Shop Items
    //This is where you add new items
    @Published var shopItems: [CosmeticItem] = [
        CosmeticItem(name: "Sword", category: .body,imageName: "Placeholder", price:200)
        //Also add "imageName: " for the image of the item. But this is the structure for all items to be implemented
        
    ]
    func purchaseItem(_ item: CosmeticItem) {
        guard points >= item.price else { return }
        guard !isOwned(item) else { return }
        
        points -= item.price
        buddy.buddyCosmeticsActive[item.category] = item
    }
    
    func equipitem(_ item: CosmeticItem) {
        guard isOwned(item) else { return }
        buddy.buddyCosmeticsActive[item.category] = item
    }
    
    func unequipItem(category: CosmeticCategory) {
        buddy.buddyCosmeticsActive.removeValue(forKey: category)
    }
    
    func isOwned(_ item: CosmeticItem) -> Bool {
        buddy.buddyCosmetics.contains(item)
    }
    
    func isEquipped(_ item: CosmeticItem) -> Bool {
        buddy.buddyCosmeticsActive[item.category] == item
    }
}
