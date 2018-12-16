//
//  UserDefaultsSettings.swift
//  NewProject
//
//  Created by Гузель on 15/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation
import UIKit

class UserDefaultsSettings {
    
    private static let userIDKey = "UserIDKey"
    private static let accessTokenKey = "AccessTokenKey"
    
    
    public static func removeAllData() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
    }
    
    
    public static func currentUserID() -> String? {
        return UserDefaults.standard.object(forKey: userIDKey) as? String
    }
    public static func setUserID(_ id: String) {
        UserDefaults.standard.set(id, forKey: userIDKey)
    }
    
    public static func currentAccessToken() -> String? {
        return UserDefaults.standard.object(forKey: accessTokenKey) as? String
    }
    public static func setAccessToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: accessTokenKey)
    }
  
    
    
}
