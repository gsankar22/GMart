//
//  User.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import Foundation


struct User: Identifiable, Codable {
    
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        
        let formatter = PersonNameComponentsFormatter()
        if let nameComponents = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: nameComponents)
        }
        return ""
    }

}
 
extension User{
    static var Mock_user = User(id: NSUUID().uuidString, fullname: "Gowri Sankar Mock", email: "test@gmail.com")
}
