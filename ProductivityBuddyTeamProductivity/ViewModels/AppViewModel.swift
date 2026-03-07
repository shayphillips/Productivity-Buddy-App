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
    
    func addTask(title: String,
                 category: [String] = [],
                 priority: Int = 0,
                 timeRequired: Int? = nil,
                 points: Int = 0,
                 recurring: Bool = false) {
        let newTask = Task(
            title: title,
            category: category,
            taskPriority: priority,
            timeRequired: timeRequired,
            pointsToAward: points,
            isComplete: false,
            taskRecurring: recurring
        )
        tasks.append(newTask)
    }
    
    func completeTask(id: UUID) {
        // Find the task by id and mark it complete
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isComplete = true
        }
    }
    func purchaseItem() {}
    func equipItem() {}
}
