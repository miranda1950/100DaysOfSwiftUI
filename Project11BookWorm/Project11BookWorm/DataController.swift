//
//  DataController.swift
//  Project11BookWorm
//
//  Created by COBE on 16.09.2022..
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container =  NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores{
            description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
