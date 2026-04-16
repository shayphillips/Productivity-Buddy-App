//
//  Cosmetics.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//

import Foundation

enum CosmeticCategory: String, CaseIterable, Hashable {
    case hat
    case face
    case body
    case room
}

struct CosmeticItem: Identifiable, Hashable {
    let name: String
    let category: CosmeticCategory
    let imageName: String
    let price: Int
    var id: String { name }
    
    static func == (lhs: CosmeticItem, rhs: CosmeticItem) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
