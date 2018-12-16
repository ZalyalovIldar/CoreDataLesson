//
//  CityObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension CityObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityObject> {
        return NSFetchRequest<CityObject>(entityName: "CityObject")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?

}
