//
//  AttachmentObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension AttachmentObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AttachmentObject> {
        return NSFetchRequest<AttachmentObject>(entityName: "AttachmentObject")
    }

    @NSManaged public var type: String?
    @NSManaged public var photoObject: PhotoObject?

}
