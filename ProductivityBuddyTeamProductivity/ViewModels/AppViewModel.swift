//
//  AppViewModel.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//

import SwiftUI
import Combine

class AppViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var myBuddy: Buddy = Buddy()
    
    func addTask() {}
    func completeTask() {}
    func purchaseItem() {}
    func equipItem() {}
}
