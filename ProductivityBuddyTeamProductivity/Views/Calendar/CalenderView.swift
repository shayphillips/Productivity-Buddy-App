//
//  CalenderView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//
// This is the Calender View  allows users to pick and choose what day to view DailyTasksView for. The current day appears as a different color.

// TO BE DECIDED: should a user be able to switch between months? should they be able to see how many tasks they have in a day? Such as canvas or simply showing the number of tasks for a day.

import SwiftUI

struct CalenderView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let weekdaySymbols = Calendar.current.shortStandaloneWeekdaySymbols
    private let calendar = Calendar.current
    private let currentDate = Date()
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text(monthYearTitle)
                    .foregroundStyle(Color("Accent"))
                    .font(.largeTitle)
                    .bold()
                    .padding(30)
                
                
                // Weekday headers
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(weekdaySymbols, id: \.self) { day in
                        Text(day)
                            .font(.headline)
                            .foregroundStyle(Color("Accent"))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                
                // Calendar grid
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(calendarCells.indices, id: \.self) { index in
                        if let day = calendarCells[index] {
                            NavigationLink(
                                destination: DailyTasksView(
                                    selectedDate: dateForDay(day)
                                )
                                .environmentObject(appViewModel.taskVM)
                            ) {
                                Text("\(day)")
                                    .frame(width: 40, height: 40)
                                    .background(
                                        isToday(day)
                                        ? Color("PrimaryColor")//.opacity(0.9)
                                        : Color("Accent").opacity(0.4)
                                    )
                                    .clipShape(Circle())
                                    .foregroundStyle(Color("Background"))
                                    .bold()
                            }
                            .buttonStyle(.plain)
                        } else {
                            // Empty cell before the first day of the month
                            Color.clear
                                .frame(width: 40, height: 40)
                        }
                    }
                }
                .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3)//Makes days stand out a bit more
                Spacer()
                
                //Text("Click on a day to view it's scheduled tasks!")
                    //.foregroundStyle(Color("Accent").opacity(0.5))
                    //.padding(15)
            }
            .padding()
        }
    }
    
    
    
    var monthYearTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentDate)
    }
    
    var daysInMonth: Int {
        guard let range = calendar.range(of: .day, in: .month, for: currentDate) else {
            return 30
        }
        return range.count
    }
    
    var firstDayOfMonth: Date {
        let components = calendar.dateComponents([.year, .month], from: currentDate)
        return calendar.date(from: components) ?? currentDate
    }
    
    var startingWeekdayOffset: Int {
        let weekday = calendar.component(.weekday, from: firstDayOfMonth)
        return weekday - 1
    }
    
    var calendarCells: [Int?] {
        let emptyCells = Array(repeating: Optional<Int>.none, count: startingWeekdayOffset)
        let dayCells = Array(1...daysInMonth).map { Optional($0) }
        return emptyCells + dayCells
    }
    
    // MARK: - Helpers
    
    func dateForDay(_ day: Int) -> Date {
        var components = calendar.dateComponents([.year, .month], from: currentDate)
        components.day = day
        return calendar.date(from: components) ?? currentDate
    }
    
    func isToday(_ day: Int) -> Bool {
        let todayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        let currentMonthComponents = calendar.dateComponents([.year, .month], from: currentDate)
        
        return todayComponents.year == currentMonthComponents.year &&
               todayComponents.month == currentMonthComponents.month &&
               todayComponents.day == day
    }
}

#Preview {
    NavigationStack {
        CalenderView()
            .environmentObject(AppViewModel())
    }
}
