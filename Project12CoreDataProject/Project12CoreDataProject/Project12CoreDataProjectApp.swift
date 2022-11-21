//
//  Project12CoreDataProjectApp.swift
//  Project12CoreDataProject
//
//  Created by COBE on 19.09.2022..
//

import SwiftUI

@main
struct Project12CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
