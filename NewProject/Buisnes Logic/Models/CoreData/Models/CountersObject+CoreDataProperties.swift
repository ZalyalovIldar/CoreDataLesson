//
//  CountersObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension CountersObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountersObject> {
        return NSFetchRequest<CountersObject>(entityName: "CountersObject")
    }

    @NSManaged public var albums: Int16
    @NSManaged public var audios: Int16
    @NSManaged public var followers: Int16
    @NSManaged public var friends: Int16
    @NSManaged public var gifts: Int16
    @NSManaged public var groups: Int16
    @NSManaged public var notes: Int16
    @NSManaged public var onlineFriends: Int16
    @NSManaged public var pages: Int16
    @NSManaged public var photos: Int16
    @NSManaged public var subscriptions: Int16
    @NSManaged public var userPhotos: Int16
    @NSManaged public var videos: Int16

}
