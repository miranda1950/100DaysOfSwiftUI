//
//  Project11BookwormApp.swift
//  Project11Bookworm
//
//  Created by COBE on 15.09.2022..
//

import SwiftUI

@main
struct Project11BookwormApp: App {
    
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
