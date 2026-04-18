//
//  TaskViewModel.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 4/1/26.
//
import SwiftUI
import Combine

class TaskViewModel: ObservableObject{
    @Published var tasks: [Task] = [
        // Example tasks for testing purposes
        Task(title: "Example Task 1", dueDate: .now, category: nil, taskPriority: 0, pointsToAward: 200, isComplete: false),
        Task(title: "Example Task 2", dueDate: .now, category: nil, taskPriority: 0, pointsToAward: 200, isComplete: false)
    ]
    @EnvironmentObject var points: Points

    var body: some View {
        Text("Points: \(points.value)")
    }
    
    func addTask(newTask: Task){
        // Pass a task instead of task properties to simplfy function
        tasks.append(newTask)
    }

    func completeTask(id: UUID) {
        // Find the task by id and mark it complete
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isComplete = true
            Points.shared.add(tasks[index].pointsToAward)
            
            if tasks[index].taskRecurring{
                handleRecurrence(for: tasks[index])
            }
        }
    }
    private func handleRecurrence(for task: Task) {
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        
        switch task.recurringFrequency {
        case .daily:
            dateComponent.day = 1
        case .weekly:
            dateComponent.weekOfYear = 1
        case .monthly:
            dateComponent.month = 1
        case .weekdaysOnly:
            let weekday = calendar.component(.weekday, from: task.dueDate)
            if(weekday == 6){ // If the day is Friday
                dateComponent.day = 3 // Monday (We are adding days to the number, so 3 days from Fri is Mon)
            }
            else if(weekday == 7){ // If the day is Saturday
                dateComponent.day = 2 // Monday (We are adding days to the number, so 2 days from Sat is Mon)
            }
            else{ // Day is not  Friday or Saturday
                dateComponent.day = 1 // Add a task tommorrow
            }
        case .none:
            return
        }
        
        if let nextDate = calendar.date(byAdding: dateComponent, to: task.dueDate) {
            // Duplicate the recurring task with all the same attributes except dueDate & id
            let taskDuplicate = Task(
                title: task.title,
                dueDate: Calendar.current.date(byAdding: .day, value: 1, to: task.dueDate)!,
                taskRecurring: task.taskRecurring,
                taskPriority: task.taskPriority,
                pointsToAward: task.pointsToAward,
                isComplete: task.isComplete
            )
        }
    }
    
    private var savePath: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent("tasks.json")
    }
    
    func saveTasks(){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(tasks)
            try data.write(to: savePath)
            print("Task saved")
        } catch{
            print("There was an error saving the task")
        }
    }
    func loadTasks(){
        do{
            let data = try Data(contentsOf: savePath)
            let decoder = JSONDecoder()
            let decodedTasks = try decoder.decode([Task].self, from: data)
            self.tasks = decodedTasks
            print("Tasks loaded")
        } catch{
            print("No existing task was found")
        }
    }
}

