//
//  ContentView.swift
//  Project11Bookworm
//
//  Created by COBE on 15.09.2022..
//

import SwiftUI


/*struct PushButtonn: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
} */



struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    // new fetch request no sorting i stavi u var  students tip Fet..<Student>
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
  //  @State private var rememberMe = false
    
    var body: some View {
/*        VStack {
        PushButtonn(title: "Remember me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
    } */
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Ron", "Hermione"]
                let lasNames = ["Granger", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lasNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
            
                try? moc.save()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
