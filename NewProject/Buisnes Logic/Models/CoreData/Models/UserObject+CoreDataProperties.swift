//
//  UserObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension UserObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserObject> {
        return NSFetchRequest<UserObject>(entityName: "UserObject")
    }

    @NSManaged public var about: String?
    @NSManaged public var bdate: String?
    @NSManaged public var canAccessClosed: Bool
    @NSManaged public var firstName: String?
    @NSManaged public var homeTown: String?
    @NSManaged public var id: String?
    @NSManaged public var interests: String?
    @NSManaged public var isClosed: Bool
    @NSManaged public var lastName: String?
    @NSManaged public var lastSeenDate: NSDate?
    @NSManaged public var lastSeenPlatform: Int16
    @NSManaged public var mobilePhone: String?
    @NSManaged public var online: Int16
    @NSManaged public var photoOrig: String?
    @NSManaged public var relation: Int16
    @NSManaged public var sex: Int16
    @NSManaged public var status: String?
    @NSManaged public var city: CityObject?
    @NSManaged public var counters: CountersObject?
    @NSManaged public var country: CountryObject?

}
