//
//  DataController.swift
//  Project11Bookworm
//
//  Created by COBE on 15.09.2022..
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            
            if let  error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
