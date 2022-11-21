//
//  ContentView.swift
//  Project16HotProspects
//
//  Created by COBE on 29.09.2022..
//

import SwiftUI


/*@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}
 */
struct ContentView: View {
    
    @State private var backgroundColor = Color.red
    
  //  @State private var output = ""
   // @StateObject var user = User()
 //   @State private var selectedTab = "One"
    var body: some View {
        
        VStack {
            Text("Hello world")
                .padding()
                .background(backgroundColor)
            Text("Change color")
                .padding()
                .contextMenu {
                    Button("Red") {
                        backgroundColor = .red
                    }
                    Button("Green") {
                        backgroundColor = .green
                    }
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                    
                }
        }
  /*      VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user) */
        
  /*      TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem{
                    Label("One", systemImage: "star")
                }
            Text("Tab 2")
                .tabItem{
                    Label("Two",systemImage: "circle")
                }
                .tag("Two")
            
        } */
        
 /*       Text(output)
            .task {
                await fetchReadings()
            } */
    }
    
 /*   func fetchReadings() async {
        let fetchTask = Task { () -> String in
            
            let url = URL(string: "https://hws.dev/readings.json")!
            let(data, _) =  try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download error: \(error.localizedDescription)"
        }
    } */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
