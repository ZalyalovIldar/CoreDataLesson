//
//  User+CoreDataClass.swift
//  VKClone
//
//  Created by Петр on 19/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    convenience init( context: NSManagedObjectContext, id: UUID, name: String, surname: String, age: Int, status: String, city: String, pageStatus: String, avatar: String, phone: String, school: String ) {
        
        self.init(context: context)
        
        self.id = id
        self.name = name
        self.surname = surname
        self.age = Int32(age)
        self.status = status
        self.city = city
        self.pageStatus = pageStatus
        self.avatar = avatar
        self.phone = phone
        self.school = school
        hobbies = "Чтение книг, курение дорогих сигар, распитие эксклюзивных алкогольных напитков"
        instagramLink = "www.instagram.com"
        facebookLink = "www.facebook.com"
    }

}
