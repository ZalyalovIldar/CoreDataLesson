//
//  CountryObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class CountryObject: NSManagedObject {
    
    static func transfrom(_ country: Country?) -> CountryObject? {
        guard let Lcoutry = country else { return nil }
        let countryObject = CountryObject(context: DataManagerImplementation.sharedInstance.getContext())
        countryObject.id = Int64(Lcoutry.id ?? -1)
        countryObject.title = Lcoutry.title
        return countryObject
    }

}
