//
//  ContentView.swift
//  Project14BucketListLearn
//
//  Created by COBE on 26.09.2022..
//
import LocalAuthentication
import MapKit
import SwiftUI



/*struct Location: Identifiable {

    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
} */

struct ContentView: View {
    
 //   @State private var isUnlocked = false
    
    
    
    
 /*   @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    */
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
        ZStack {
            Map(coordinateRegion:  $viewModel.mapRegion ,annotationItems: viewModel.locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                        //44  minimum size for interactive views
                            .background(.white)
                            .clipShape(Circle())
                        
                        Text(location.name)
                            .fixedSize()
                    }
                    .onTapGesture {
                        viewModel.selectedPlace = location
                    }
                }
            }
                .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Button {
                        viewModel.addLocation()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(item: $viewModel.selectedPlace) { place in
            
            EditView(location: place) { newLocation in
                viewModel.update(location: newLocation)
            }
        }
  /*      Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                
                Circle()
                    .stroke(.red,lineWidth: 3)
                    .frame(width: 44, height: 44)
                    .onTapGesture {
                        print("Tapped \(location.name)")
                    }
                    
                
                
            }
        }
          .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                do {
                    try str.write(to: url,atomically: true,encoding: .utf8)
                    
                    let input = try String(contentsOf: url)
                    
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else  {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate) */
            
        } else {
            Button("Unlock Places") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    
 /*   func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if success {
                    isUnlocked = true
                }  else {
                    // problem
                }
                
            }
        } else {
            //no biometrics
        }
    }
    
  func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    } */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
