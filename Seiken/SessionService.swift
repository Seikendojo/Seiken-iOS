//
//  SessionService.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation
import UICKeyChainStore

class SessionService
{
    typealias keys = Constants.Keys.SessionService
    
    // MARK: - Token
    static func storeUserToken(_ token: String)
    {
        UICKeyChainStore.setString(token, forKey: keys.token)
    }
    
    static func retriveUserToken() -> String
    {
        return UICKeyChainStore.string(forKey: keys.token) ?? keys.notFound
    }
    
    static func removeUserToken()
    {
        UICKeyChainStore.removeItem(forKey: keys.token)
    }
}
