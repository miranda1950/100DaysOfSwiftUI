//
//  Favourites.swift
//  Project19SnowSneekerLearn
//
//  Created by COBE on 12.10.2022..
//

import Foundation

class Favourites: ObservableObject {
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        //load saved data
         resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
    }
    
    func save() {
        
    }
}
