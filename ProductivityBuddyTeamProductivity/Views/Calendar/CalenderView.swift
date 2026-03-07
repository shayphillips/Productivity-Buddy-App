//
//  CalenderView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//
// This is the Calender View  allows users to pick and choose what day to view DailyTasksView for. The current day appears as a different color.

// TO BE DECIDED: should a user be able to switch between months? should they be able to see how many tasks they have in a day? Such as canvas or simply showing the number of tasks for a day.
// TO BE IMPLEMENTED: Stylizing and any other decisions made
import SwiftUI

struct CalenderView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let days = Array(1...31)
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Calender")
                    .font(.largeTitle)
                    .bold()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(days, id: \.self) { day in
                        
                        NavigationLink(
                            destination: DailyTasksView(date: dateForDay(day))
                        ) {
                            Text("\(day)")
                                .frame(width: 40, height: 40)
                                .background(
                                    isToday(day)
                                    ? Color.blue.opacity(0.3)
                                    : Color.gray.opacity(0.2)
                            
                                )
                                .clipShape(Circle())
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

func dateForDay (_ day: Int) -> Date {
    var components = Calendar.current.dateComponents ([.year, .month, .day], from: Date())
    components.day = day
    return Calendar.current.date(from: components) ?? Date()
}

func isToday(_ day: Int) -> Bool {
    let today = Calendar.current.component(.day, from: Date())
    return today == day
}

#Preview {
    CalenderView()
}
