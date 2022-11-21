//
//  ContentView.swift
//  Project18LayoutAndGeometry
//
//  Created by COBE on 04.10.2022..
//

import SwiftUI

/*extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
    
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context[.top]
    }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
} */


struct ContentView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        
    /*    HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        } */
        GeometryReader { fullView in
            
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))

                    }
                    .frame(height: 40)
                    
                }
            }
            
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
