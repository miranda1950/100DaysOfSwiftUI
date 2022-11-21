//
//  Project11BookWormApp.swift
//  Project11BookWorm
//
//  Created by COBE on 16.09.2022..
//

import SwiftUI

@main
struct Project11BookWormApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
