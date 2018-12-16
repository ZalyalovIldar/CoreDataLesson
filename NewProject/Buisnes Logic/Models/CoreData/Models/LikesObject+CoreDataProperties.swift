//
//  LikesObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension LikesObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LikesObject> {
        return NSFetchRequest<LikesObject>(entityName: "LikesObject")
    }

    @NSManaged public var canLike: Int16
    @NSManaged public var canPublish: Int16
    @NSManaged public var count: Int32
    @NSManaged public var userLikes: Int16

}
