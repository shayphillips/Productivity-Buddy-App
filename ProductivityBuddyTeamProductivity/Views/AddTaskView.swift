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

    @State private var title: String = ""
    @State private var categoryText: String = ""
    @State private var priorityText: String = ""
    @State private var date: Date = .now
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Add Task Screen")
                .font(.title)
                .bold()
            
            Divider ()
            
            Text("Task Name:")
            TextField("Task name will go here", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            
            Text("Category:")
            TextField("This will be a drop down menu", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            
            Text("Date:")
            TextField("The Date that task needs to be done will go here",
                      text: .constant(""))
            .textFieldStyle(.roundedBorder)
            
            Text("Priority:")
            TextField ("This will be a drop down menu", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            // This button will save the attributes of the task
            Button("Save Task") {
                let categories = categoryText
                    .split(separator: ",")
                    .map { $0.trimmingCharacters(in: .whitespaces) }

                let priority = Int(priorityText) ?? 0

                appViewModel.taskVM.addTask(
                    //Hardcoded above
                    title: title,
                    //category: categories,
                    priority: priority
                )
            }
            .buttonStyle(.borderedProminent)
            Button("Cancel(NOT FUNCTIONAL)"){
            }
            
        }
        .padding()
        .navigationTitle("Add Task")
    }
}

#Preview {
    AddTaskView()
}
