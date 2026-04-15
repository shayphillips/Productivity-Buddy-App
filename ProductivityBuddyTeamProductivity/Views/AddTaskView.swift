//
//  AddTaskView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/4/26.
// This is the AddTask View  that users will access to Create a new task, by creating a name, choosing from a preset list of categorys, creating a date, and choosing from a reset list of priority levels. They then can either save or cancel the task.

// TO BE DECIDED: Where should save and cancel take the user?
// TO BE IMPLEMENTED: Assigning all qualities of the task, Save button, cancel button.

import SwiftUI

struct AddTaskView: View{
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var category: TaskCategory? = nil
    @State private var priority: Int = 0
    @State private var date: Date = .now
    @State private var pointsToAward: Int = 0
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            
            Form {
                Section("Task Info") {
                    TextField("Enter task name", text: $title)
                        .foregroundStyle(Color("Accent"))
                        .bold()
                    
                    DatePicker(
                        "Due Date",
                        selection: $date,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    
                    Picker("Priority", selection: $priority) {
                        Text("0 - No Rush").tag(0)
                        Text("1 - Low").tag(1)
                        Text("2 - Medium").tag(2)
                        Text("3 - Urgent").tag(3)
                    }
                    
                    Stepper("Points: \(pointsToAward)", value: $pointsToAward, in: 0...500)
                }
                .listRowBackground(Color("PrimaryColor").opacity(0.3))
                
                Section {
                    Button {
                        let newTask = Task(
                            title: title,
                            dueDate: date,
                            taskPriority: priority,
                            pointsToAward: pointsToAward,
                            isComplete: false
                        )
                        
                        appViewModel.taskVM.addTask(newTask: newTask)
                        appViewModel.taskVM.saveTasks()
                        dismiss()
                    } label: {
                        Text("Save Task")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray.opacity(0.4) : Color("PrimaryColor"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    .listRowBackground(Color.clear)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.85))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Add Task")
            .scrollContentBackground(.hidden)
            .foregroundStyle(Color("Accent"))
        }
        
    }
}

#Preview {
    AddTaskView()
        .environmentObject(AppViewModel())
}
