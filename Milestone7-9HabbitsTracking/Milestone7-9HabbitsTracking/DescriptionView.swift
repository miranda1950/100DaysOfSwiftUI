//
//  DescriptionView.swift
//  Milestone7-9HabbitsTracking
//
//  Created by COBE on 14.09.2022..
//

import SwiftUI


struct DescriptionView: View {
    
    let newActivity: Activites
    
    var body: some View {
        Text(newActivity.activites.description)
        
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(newActivity: Activites())
    }
}
