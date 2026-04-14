//
//  MainMenuView.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Tyler Sams on 3/6/26.
//
// This is the MainMenu View. This is the starting point that the app opens up to and gives users three options, go to their daily tasks, their calender, and their character.

// TO BE IMPLEMENTED: Stylizing, settings view and options(questionable?)
import SwiftUI

struct MainMenuView: View {
    
    @State private var tasks: [Task] = []
    
    var body: some View {
            NavigationStack {
                ZStack { //If the plan is still to have an image in the background, this is where it will go!
                    Color("Background")
                        .ignoresSafeArea()
                VStack(spacing: 30) {
                    Text("Bearable")
                        .font(.system(size: 64, weight: .heavy, design: .rounded))
                        .bold()
                        .tracking(2)
                        .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                        .padding(30)
                        .foregroundColor(Color("Accent"))
                    
                    Divider()
                    
                    NavigationLink {
                        DailyTasksView(tasks: $tasks, selectedDate: Date())
                    } label: {
                        Text("Today's Tasks")
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
                    } label: {
                        Text("Character")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.7), radius: 9, x: 0, y: 3) //shadow will help text stand out if the image is added
                    }

                    NavigationLink {
                        CalenderView(tasks: $tasks)
                    } label: {
                        Text("Calendar")
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
}
