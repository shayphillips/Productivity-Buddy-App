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
    let id = UUID()
    let name: String
    let category: CosmeticCategory
    let imageName: String
    let price: Int
}
