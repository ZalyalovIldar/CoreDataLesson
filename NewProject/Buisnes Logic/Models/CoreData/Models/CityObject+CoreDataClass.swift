//
//  CityObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class CityObject: NSManagedObject {

    static func transfrom(_ city: City?) -> CityObject? {
        guard let Lcity = city else { return nil }
        let cityObject = CityObject(context: DataManagerImplementation.sharedInstance.getContext())
        cityObject.id = Int64(Lcity.id ?? -1)
        cityObject.title = Lcity.title
        return cityObject
    }
    
}
