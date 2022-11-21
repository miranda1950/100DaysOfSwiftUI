//
//  Activities.swift
//  Milestone7-9HabbitsTracking
//
//  Created by COBE on 14.09.2022..
//

import Foundation


class Activites: ObservableObject {
    @Published var activites = [Activity] () {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activites) {
                UserDefaults.standard.set(encoded, forKey: "Activity")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activity") {
            let decoder = JSONDecoder()
            
            if let decodedActivites = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activites = decodedActivites
                return
            }
            
        }
        activites = []
    }
}
