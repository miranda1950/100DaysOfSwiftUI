//
//  ContentView.swift
//  Milestone10-12UserFrieends
//
//  Created by COBE on 27.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User] ()
    @State private var friends = [Friends] ()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(users, id: \.name) { user in
                    NavigationLink {
                        DetailView(user: user, friends: friends)
                    } label: {
                        
                    
                    VStack(alignment: .leading){
                        Text(user.name)
                            .font(.headline)
                        
                        Text(String(user.age))
                        
                    }
                }
                }
            }
            .navigationTitle("Users")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                
                users = decodedResponse
            }
            
                
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
