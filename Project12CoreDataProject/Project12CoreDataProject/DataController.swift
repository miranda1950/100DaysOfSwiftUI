//
//  DataController.swift
//  Project12CoreDataProject
//
//  Created by COBE on 19.09.2022..
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container =  NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores{
            description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
