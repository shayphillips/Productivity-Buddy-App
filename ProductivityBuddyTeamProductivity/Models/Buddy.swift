//
//  Buddy.swift
//  ProductivityBuddyTeamProductivity
//
//  Created by Luke Sturm on 3/6/26.
//
import Foundation

struct Buddy {
    var buddyLevel: Int = 0 //Leveling up your buddy (we can remove if we want to)
    var buddyName: String = "Unknown"
    var buddyCosmetics: [String] = [] // List of all Cosmetics buddy has unlocked
    var buddyCosmeticsActive: [String] = [] // List of cometics currently being used.
}

