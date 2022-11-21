//
//  User.swift
//  Milestone10-12UserFrieends
//
//  Created by COBE on 27.09.2022..
//

  import Foundation

struct User: Codable {
    
    let name: String
    let age: Int
    let company:  String
    let friends: [Friends]
    
}

/*class Api {
    
    func getUser() {
        
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json ") else {
        print("Invalid URL")
        return
    }
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
            let users = try? JSONDecoder().decode(User.self, from: <#T##Data#>)
            
            
        }
    }
    
}
  
  */
