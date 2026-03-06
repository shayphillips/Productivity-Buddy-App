//
//  DailyTasksView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Xander Lollis on 3/6/26.
//
//Functionality on this view is open to change based on what the points system will look like as well as other backend developments. This is a WIP.

import SwiftUI

struct DailyTasksView: View {
    
    //A few example tasks that can obviously be deleted later
    @State private var tasks: [Task] = [
        Task(
            title: "Finish Swift assignment",
            selectedCategory: ["Study"],
            taskPriority: 3,
            timeRequired: 60,
            pointsToAward: 25,
            isComplete: false,
            taskRecurring: false
        ),
        Task(
            title: "Go to the gym",
            selectedCategory: ["Exercise"],
            taskPriority: 2,
            timeRequired: 45,
            pointsToAward: 15,
            isComplete: true,
            taskRecurring: true
        ),
        Task(
            title: "Clean desk",
            selectedCategory: ["Work"],
            taskPriority: 1,
            timeRequired: 20,
            pointsToAward: 10,
            isComplete: false,
            taskRecurring: false
        )
    ]
    
    var completedTasksCount: Int {
        tasks.filter { $0.isComplete }.count
    }
    
    //Still uncertain on points system, adjustments can be made to this as needed.
    var totalPointsEarned: Int {
        tasks.filter { $0.isComplete }.map { $0.pointsToAward }.reduce(0, +)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Today's Progress")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Completed: \(completedTasksCount)/\(tasks.count)")
                        .font(.subheadline)
                    
                    Text("Points Earned: \(totalPointsEarned)")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)
                
                //Basic layout for now
                List {
                    ForEach($tasks) { $task in
                        HStack(alignment: .top, spacing: 12) {
                            
                            Button {
                                task.isComplete.toggle()
                            } label: {
                                Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                                    .font(.title2)
                                    .foregroundColor(task.isComplete ? .green : .gray)
                            }
                            .buttonStyle(.plain)
                            
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(task.title)
                                    .font(.headline)
                                    .strikethrough(task.isComplete)
                                    .foregroundColor(task.isComplete ? .gray : .primary)
                                
                                Text("Category: \(categoryText(for: task.selectedCategory))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Text("Priority: \(priorityText(for: task.taskPriority))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                if let time = task.timeRequired {
                                    Text("Time Required: \(time) min")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Text("Points: \(task.pointsToAward)")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                                
                                if task.taskRecurring {
                                    Text("Recurring Task")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.orange.opacity(0.2))
                                        .cornerRadius(8)
                                }
                            }
                            
                            
                            Spacer()
                        }
                        .padding(.vertical, 6)
                    }
                }
                .listStyle(.plain)
                
                NavigationLink(destination: MainMenuView()) {
                    Text("Home")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            .navigationTitle("Daily Tasks")
            
        }
    }
    
    
    func categoryText(for categories: [String]) -> String {
        if categories.isEmpty {
            return "None"
        } else {
            return categories.joined(separator: ", ")
        }
    }
    
    //Based on comment from task struct creation in ContentView
    func priorityText(for priority: Int) -> String {
        switch priority {
        case 0:
            return "No Rush"
        case 1:
            return "Low"
        case 2:
            return "Medium"
        case 3:
            return "Urgent"
        default:
            return "Unknown"
        }
    }
}

#Preview {
    DailyTasksView()
}
