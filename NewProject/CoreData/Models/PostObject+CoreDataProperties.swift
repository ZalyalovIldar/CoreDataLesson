//
//  PostObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 26/11/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension PostObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostObject> {
        return NSFetchRequest<PostObject>(entityName: "PostObject")
    }

    @NSManaged public var avatar: NSData?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var someImage: NSData?
    @NSManaged public var textDescription: String?
    
    

}
