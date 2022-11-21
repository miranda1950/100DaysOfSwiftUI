//
//  AddActivity.swift
//  Milestone7-9HabbitsTracking
//
//  Created by COBE on 14.09.2022..
//

import SwiftUI

struct AddActivity: View {
    
    @ObservedObject var newActivities: Activites
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter the title", text: $title)
                
                TextField("Enter the description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar{
                Button("Save") {
                    let activity = Activity(title: title, description: description)
                    
                    newActivities.activites.append(activity)
                    
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    
    
    static var previews: some View {
        AddActivity(newActivities: Activites())
    }
}
