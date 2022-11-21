//
//  ContentView.swift
//  Milestone7-9HabbitsTracking
//
//  Created by COBE on 14.09.2022..
//

import SwiftUI

struct ContentView: View {
    @StateObject var newActivites = Activites()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(newActivites.activites) {
                        activity in
                    NavigationLink {
                        DescriptionView(newActivity: newActivites)
                    } label: {
                        
                    Text(activity.title)
                }
                }
            
                .onDelete(perform: removeActivities)
            
            }
            .navigationTitle("HabbitTracker")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(newActivities: newActivites)
            }
        }
    }
    
    func removeActivities(at offsets: IndexSet) {
        newActivites.activites.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
