//
//  ExpenseItem.swift
//  Project7iExpense
//
//  Created by COBE on 12.09.2022..
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID ()
    let name: String
    let type: String
    let amount: Double
    
}
