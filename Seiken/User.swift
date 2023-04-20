//
//  User.swift
//  Seiken
//
//  Created by Shahin on 2017-10-07.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation
import Firebase

class User
{
    typealias keys = Constants.Firebase.Keys.Users
    
    // MARK: - Properties
    static var current = User()
    
    var seikenUserRole: SeikenUserRole = .nonmember
    var userID: String?
    var firstName: String?
    var lastName: String?
    var email: String? { didSet { userID = email?.replacingOccurrences(of: ".", with: "") }}
    
    var friendsFullName = ""
    var friendsEmail = ""
    var friendsAge = ""
    var friendsPhone = ""
    
    var referrersFullName = ""
    var referrersEmail = ""
    var referrersAge = ""
    var referrersPhone = ""
    
    var password: String?
    var birthDate: String?
    
    // MARK: - Parsers & Zippers
    func zip() -> [String: Any]
    {
        var dictionary = [String: Any]()
        
        dictionary[keys.userID] = userID
        dictionary[keys.email] = email
        dictionary[keys.firstName] = firstName
        dictionary[keys.lastName] = lastName
        dictionary[keys.birthDate] = birthDate
        dictionary[keys.role] = seikenUserRole.rawValue
        
        return dictionary
    }
    
    func parse(_ snapshot: DataSnapshot)
    {
        let userDict = snapshot.value as? [String: Any]
        
        firstName = userDict?[keys.firstName] as? String
        lastName = userDict?[keys.lastName] as? String
        email = userDict?[keys.email] as? String
        birthDate = userDict?[keys.birthDate] as? String
        guard let roleInt = userDict?[keys.role] as? Int, let role = SeikenUserRole(rawValue: roleInt) else { return }
        seikenUserRole = role
    }
}
