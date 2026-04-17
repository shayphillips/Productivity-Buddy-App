//
//  MainMenuView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//
// This is the MainMenu View. This is the starting point that the app opens up to and gives users three options, go to their daily tasks, their calender, and their character.


import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color("Accent")
                        .ignoresSafeArea()
                    Image("Homepage_Tree")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                VStack(spacing: 30) {
                    Text("Bearable")
                        .font(.system(size: 64, weight: .heavy, design: .rounded))
                        .bold()
                        .tracking(2)
                        .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                        .padding(30)
                        .padding(.top, 60)
                        .foregroundColor(Color("Accent"))
                    
                    Divider()
                    
                    NavigationLink {
                        DailyTasksView(selectedDate: Date())
                            .environmentObject(appViewModel.taskVM)
                    } label: {
                        Text("Today's Tasks")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                    }
                    
                    
                    NavigationLink {
                        CharacterView()
                            .environmentObject(BuddyViewModel())
                    } label: {
                        Text("Character")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                    }

                    NavigationLink {
                        CalenderView()
                            .environmentObject(appViewModel)
                    } label: {
                        Text("Calendar")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                    }
                    
                    NavigationLink {
                        AddTaskView()
                    } label: {
                        Text("Add Task")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                    }

                    
                    
                    Spacer()
                }
                .padding()
                //.navigationTitle("Main Menu")
            }
        }
    }
}

#Preview{
    MainMenuView()
        .environmentObject(AppViewModel())
        .environmentObject(BuddyViewModel())
        .environmentObject(Points.shared)
}
