//
//  Tasks.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//

import Foundation

enum RecurrenceFrequency: String {
    case daily, weekly, monthly, weekdaysOnly
}

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var dueDate: Date = Date() // Sets date = to right now
    
    //var category: [String] = [] // (WIP) Select category from categories
    
    //These are the properties of the recurring task
    var taskRecurring: Bool = false
    var recurringFrequency: RecurrenceFrequency?
    
    var taskPriority: Int = 0 //Scale from 0 - 3, 0: No Rush, 3: Urgent
    var timeRequired: Int? = 0
    var pointsToAward: Int = 0 //The # of points that are received when task is completed
    var isComplete: Bool = false
   
}




