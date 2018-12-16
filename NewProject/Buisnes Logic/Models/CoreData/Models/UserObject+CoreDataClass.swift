//
//  UserObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class UserObject: NSManagedObject {
    
    static func transfrom(_ user: User) -> UserObject? {
        
        let userObject = UserObject(context: DataManagerImplementation.sharedInstance.getContext())
        userObject.id = String(user.id ?? -1)
        userObject.firstName = user.firstName
        userObject.lastName = user.lastName
        userObject.isClosed = user.isClosed ?? false
        userObject.canAccessClosed = user.canAccessClosed ?? false
        userObject.sex = Int16(user.sex ?? -1)
        userObject.photoOrig = user.photoOrig
        userObject.status = user.status
        userObject.counters = CountersObject.transfrom(user.counters)
        userObject.homeTown = user.homeTown
        userObject.country = CountryObject.transfrom(user.country)
        userObject.city = CityObject.transfrom(user.city)
        userObject.status = user.status
        userObject.mobilePhone = user.mobilePhone
        userObject.bdate = user.bdate
        userObject.interests = user.interests
        userObject.about = user.about
        if let date = user.lastSeenDate {
            userObject.lastSeenDate = date as NSDate
        }
        userObject.lastSeenPlatform = Int16(user.lastSeenPlatform ?? -1)
        
        
        return userObject
    }
}
