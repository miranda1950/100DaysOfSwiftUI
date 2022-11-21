//
//  DetailView.swift
//  Milestone10-12UserFrieends
//
//  Created by COBE on 27.09.2022..
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    let friends: [Friends]
    
    
    var body: some View {
        NavigationView {
            VStack {
               Text(String(user.age))
                    .font(.largeTitle)
              Text(user.company)
                Text("My Friends: ")
                    .bold()
                    .font(.title)
                ForEach(friends, id: \.id ) { friend in
                   
                    VStack {
                        HStack{
                            Text(friend.name)
                            
                        }
                    }
                }
                
                    
            }
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    init(user: User, friends: [Friends]) {
        self.user = user
        self.friends = user.friends
  
    }
}

/*struct DetailView_Previews: PreviewProvider {
    static let user = User()
    static var previews: some View {
        
        DetailView(user: user["aksd"])
    }
}
 */

