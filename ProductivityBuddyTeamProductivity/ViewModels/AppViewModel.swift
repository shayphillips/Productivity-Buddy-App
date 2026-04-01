//
//  AppViewModel.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//

import SwiftUI
import Combine

class AppViewModel: ObservableObject {
    @Published var taskVM = TaskViewModel() // I moved the Task functions into TaskViewModel
    @Published var buddyVM = BuddyViewModel() // I moved the Buddy functions into BuddyViewModel (WIP)
}
