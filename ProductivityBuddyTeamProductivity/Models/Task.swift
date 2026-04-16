//
//  Tasks.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//

import Foundation

enum RecurrenceFrequency: String, Codable{
    case daily,
         weekly,
         monthly,
         weekdaysOnly
}

enum TaskCategory: String, Codable, CaseIterable {
    case work,
         personal,
         hobbies,
         fitness,
         family,
         other
}

struct Task: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var dueDate: Date
    var category: TaskCategory?
        
    // Properties of the recurring task
    var taskRecurring: Bool
    var recurringFrequency: RecurrenceFrequency?
    
    var taskPriority: Int //Scale from 0 - 3, 0: No Rush, 3: Urgent
    var pointsToAward: Int //The # of points that are received when task is completed
    var isComplete: Bool
    
    
    // Only have to have title for task upon creation
    init(title: String, dueDate: Date = Date(), category: TaskCategory? = nil, taskRecurring: Bool = false, taskPriority: Int = 0, pointsToAward: Int = 0, isComplete: Bool = false) {
        self.title = title
        self.dueDate = dueDate
        self.category = category
        self.taskRecurring = taskRecurring
        self.taskPriority = taskPriority
        self.pointsToAward = pointsToAward
        self.isComplete = isComplete
    }
    

}
