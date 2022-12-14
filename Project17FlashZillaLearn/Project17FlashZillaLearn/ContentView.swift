//
//  ContentView.swift
//  Project17FlashZillaLearn
//
//  Created by COBE on 03.10.2022..
//
import CoreHaptics
import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
  //  @State private var engine: CHHapticEngine?
  //  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
 //   @State private var counter = 0
    var body: some View {
   /*     Text("Hello, world!")
            .padding()
            .onAppear(perform: prepareHaptics)
            .onTapGesture {
                complexSuccess()
            }
    
         Text("Hello world")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                print("The time is now \(time)")
                }
                counter += 1
            } */
        Text("Hello world")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
        
    }
    
  /*  func simpleSuccess() {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: ")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
       
        var events = [CHHapticEvent]()
        for i in stride(from: 0, to: 1, by: 0.1) {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
        
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
        events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1-i))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1-i))
        
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
        events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
   */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
