//
//  CountryObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension CountryObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryObject> {
        return NSFetchRequest<CountryObject>(entityName: "CountryObject")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?

}
