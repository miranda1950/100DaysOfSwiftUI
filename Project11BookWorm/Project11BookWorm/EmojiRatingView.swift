//
//  EmojiRatingView.swift
//  Project11BookWorm
//
//  Created by COBE on 16.09.2022..
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("π£")
        case 2:
            return Text("π")
        case 3:
            return Text("π")
        case 4:
            return Text("βΊοΈ")
        default:
            return Text("π€©")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
