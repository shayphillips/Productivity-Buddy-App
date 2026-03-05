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
            
            Text("Prioroty:")
            TextField ("This will be a drop down menu", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            Button("Save Task(NOT FUNCTIONAL)"){
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
