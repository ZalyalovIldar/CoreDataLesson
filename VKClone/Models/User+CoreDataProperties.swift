//
//  User+CoreDataProperties.swift
//  VKClone
//
//  Created by Петр on 19/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    // User age
    @NSManaged public var age: Int32
    
    // User main photo
    @NSManaged public var avatar: String?
    
    // Where user from
    @NSManaged public var city: String?
    
    // User facebook page
    @NSManaged public var facebookLink: String?
    
    // User hobbies
    @NSManaged public var hobbies: String?
    
    // User identificator
    @NSManaged public var id: UUID!
    
    // User instagram page
    @NSManaged public var instagramLink: String?
    
    // User name
    @NSManaged public var name: String?
    
    // Status of user account
    @NSManaged public var pageStatus: String?
    
    // Phone number
    @NSManaged public var phone: String?
    
    // Graduated from
    @NSManaged public var school: String?
    
    // User status
    @NSManaged public var status: String?
    
    // User surname
    @NSManaged public var surname: String?
    
    // User vk page
    @NSManaged public var vkLink: String?

}
