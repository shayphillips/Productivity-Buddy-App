//
//  DailyTasksView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Xander Lollis on 3/6/26.
//
//Functionality on this view is open to change based on what the points system will look like as well as other backend developments. This is a WIP.

import SwiftUI

struct DailyTasksView: View {
    
    @EnvironmentObject var points: Points
    @EnvironmentObject var taskVM: TaskViewModel
        let selectedDate: Date
        
        var tasks: [Task] {
            taskVM.tasks
        }
    
    var tasksForSelectedDay: [Task] {
        tasks.filter { Calendar.current.isDate($0.dueDate, inSameDayAs: selectedDate) }
    }
    
    var activeTasks: [Task] {
        tasksForSelectedDay.filter { !$0.isComplete }
    }
    
    var completedTasks: [Task] {
        tasksForSelectedDay.filter { $0.isComplete }
    }
    
    var completedTasksCount: Int {
        completedTasks.count
    }
    
//    var totalPointsEarned: Int {
//        completedTasks.map { $0.pointsToAward }.reduce(0, +)
//    }
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tasks for \(formattedDate(selectedDate))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Accent"))
                    
                    Text("Completed: \(completedTasksCount)/\(tasksForSelectedDay.count)")
                        .font(.subheadline)
                        .foregroundColor(Color("Accent"))
                    
                    Text("Points: \(points.value)")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                //.background(Color.blue.opacity(0.1))
                .cornerRadius(12)
                
                List {
                    Section("Active Tasks") {
                        if activeTasks.isEmpty {
                            Text("No active tasks for this day.")
                                .foregroundColor(.secondary)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("PrimaryColor"))
                                )
                        } else {
                            ForEach(activeTasks) { task in
                                taskRow(for: task)
                            }
                        }
                    }
                    .foregroundColor(Color("Accent"))
                    
                    Section("Completed Tasks") {
                        if completedTasks.isEmpty {
                            Text("No completed tasks for this day.")
                                .foregroundColor(.secondary)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("PrimaryColor"))
                                )
                        } else {
                            ForEach(completedTasks) { task in
                                taskRow(for: task)
                            }
                        }
                    }
                    .foregroundColor(Color("Accent"))
                }
                .scrollContentBackground(.hidden)
                //.background(Color("PrimaryColor"))
                .listStyle(.insetGrouped)
            }
            .padding()
            .navigationTitle("Daily Tasks")
        }
    }
    
    @ViewBuilder
    func taskRow(for task: Task) -> some View {
        HStack(alignment: .top, spacing: 12) {
            
            Button {
                toggleTaskCompletion(taskID: task.id)
            } label: {
                Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(task.isComplete ? .green : .gray)
            }
            .buttonStyle(.plain)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(task.isComplete ? .gray : .primary)
                
                Text("Category: \(categoryText(task.category))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Priority: \(priorityText(for: task.taskPriority))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Points: \(task.pointsToAward)")
                    .font(.subheadline)
                    .foregroundColor(.green)
                
                if task.taskRecurring {
                    Text("Recurring: \(recurrenceText(task.recurringFrequency))")
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
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("PrimaryColor"))
        )
    }
    
    func toggleTaskCompletion(taskID: UUID) {
        if let index = taskVM.tasks.firstIndex(where: { $0.id == taskID }) {
            if taskVM.tasks[index].isComplete {
                // If you want to support unchecking without refund:
                taskVM.tasks[index].isComplete = false
                taskVM.saveTasks()
            } else {
                taskVM.completeTask(id: taskID) // awards points here
                taskVM.saveTasks()
            }
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
    
    func priorityText(for priority: Int) -> String {
        switch priority {
        case 0: return "No Rush"
        case 1: return "Low"
        case 2: return "Medium"
        case 3: return "Urgent"
        default: return "Unknown"
        }
    }
    
    func categoryText(_ category: TaskCategory?) -> String {
        switch category {
        case .work: return "Work"
        case .personal: return "Personal"
        case .hobbies: return "Hobbies"
        case .fitness: return "Fitness"
        case .family: return "Family"
        case .other: return "Custom"
        case nil: return "None"
        }
    }
    
    func recurrenceText(_ frequency: RecurrenceFrequency?) -> String {
        switch frequency {
        case .daily: return "Daily"
        case .weekly: return "Weekly"
        case .monthly: return "Monthly"
        case .weekdaysOnly: return "Weekdays Only"
        case nil: return "None"
            
        }
    }
}


#Preview {
    DailyTasksView(selectedDate: Date())
        .environmentObject(TaskViewModel())
        .environmentObject(Points.shared)
}
