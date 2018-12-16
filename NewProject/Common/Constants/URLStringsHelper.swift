//
//  URLStringsHelper.swift
//  NewProject
//
//  Created by Гузель on 15/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

class URLStringsHelper {
    
    enum URLKey: String {
        case baseURL    = "https://api.vk.com/method"
        case apiVersion = "5.92"
        case profile    = "/account.getProfileInfo"
        case getUser    = "/users.get"
        case wallGet    = "/wall.get"
    }
    
    static func string(for key: URLKey) -> String {
        switch key {
        default:
            return key.rawValue
        }
    }
    
}
