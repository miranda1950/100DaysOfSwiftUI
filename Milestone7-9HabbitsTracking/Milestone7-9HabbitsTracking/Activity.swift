//
//  Activity.swift
//  Milestone7-9HabbitsTracking
//
//  Created by COBE on 14.09.2022..
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
}
