//
//  Tasks.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//

import Foundation

struct Task: Identifiable {
    //        let categoryList [String] = ["Misc","Study","Work","Exercise","Hobbies","","None"]
    let id: UUID = UUID()
    var title: String
    var category: [String] = [] // (WIP) Select category from categories
    var taskPriority: Int = 0 //Scale from 0 - 3, 0: No Rush, 3: Urgent
    var timeRequired: Int? = 0
    var pointsToAward: Int = 0 //The # of points that are received when task is completed
    var isComplete: Bool = false
    var taskRecurring: Bool = false
}


