//
//  ProductivityBuddyTeamProductivityApp.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/4/26.
//

import SwiftUI

@main
struct ProductivityBuddyTeamProductivityApp: App {
    @StateObject private var appViewModel = AppViewModel()
    @StateObject var viewModel = BuddyViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainMenuView()
                .environmentObject(appViewModel)
                .environmentObject(viewModel)
        }
    }
}
