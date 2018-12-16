//
//  PhotoSizeObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension PhotoSizeObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoSizeObject> {
        return NSFetchRequest<PhotoSizeObject>(entityName: "PhotoSizeObject")
    }

    @NSManaged public var height: Int16
    @NSManaged public var type: String?
    @NSManaged public var url: String?
    @NSManaged public var width: Int16

}
