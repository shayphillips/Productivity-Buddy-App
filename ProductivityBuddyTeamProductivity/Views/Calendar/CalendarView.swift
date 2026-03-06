//
//  CalendarView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//

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
