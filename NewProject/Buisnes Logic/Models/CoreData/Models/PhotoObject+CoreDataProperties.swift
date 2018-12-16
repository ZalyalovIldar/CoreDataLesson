//
//  PhotoObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension PhotoObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoObject> {
        return NSFetchRequest<PhotoObject>(entityName: "PhotoObject")
    }

    @NSManaged public var id: Int32
    @NSManaged public var accessKey: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var photoSizeObject: Set<PhotoSizeObject>?

}

// MARK: Generated accessors for photoSizeObject
extension PhotoObject {

    @objc(addPhotoSizeObjectObject:)
    @NSManaged public func addToPhotoSizeObject(_ value: PhotoSizeObject)

    @objc(removePhotoSizeObjectObject:)
    @NSManaged public func removeFromPhotoSizeObject(_ value: PhotoSizeObject)

    @objc(addPhotoSizeObject:)
    @NSManaged public func addToPhotoSizeObject(_ values: NSSet)

    @objc(removePhotoSizeObject:)
    @NSManaged public func removeFromPhotoSizeObject(_ values: NSSet)

}
