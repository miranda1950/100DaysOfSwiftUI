//
//  Milestone13_15PickerAndCollectionApp.swift
//  Milestone13-15PickerAndCollection
//
//  Created by COBE on 28.09.2022..
//

import SwiftUI

@main
struct Milestone13_15PickerAndCollectionApp: App {
   
    var body: some Scene {
        WindowGroup {
            ContentView(listImages: [ListImage(id: UUID())])
        }
    }
}
