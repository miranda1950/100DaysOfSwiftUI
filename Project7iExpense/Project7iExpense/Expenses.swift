//
//  Expenses.swift
//  Project7iExpense
//
//  Created by COBE on 12.09.2022..
//

import Foundation

class Expenses: ObservableObject {
    @Published var items  = [ExpenseItem] () {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items")
        {
            if let decodedItems = try? JSONDecoder()
                .decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
