//
//  CountersObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class CountersObject: NSManagedObject {
    
    static func transfrom(_ counters: Counters?) -> CountersObject? {
        guard let Lcounters = counters else { return nil }
        let countersObject = CountersObject(context: DataManagerImplementation.sharedInstance.getContext())
        countersObject.albums = Int16(Lcounters.albums ?? -1)
        countersObject.videos = Int16(Lcounters.videos ?? -1)
        countersObject.audios = Int16(Lcounters.audios ?? -1)
        countersObject.notes = Int16(Lcounters.notes ?? -1)
        countersObject.photos = Int16(Lcounters.photos ?? -1)
        countersObject.groups = Int16(Lcounters.groups ?? -1)
        countersObject.gifts = Int16(Lcounters.gifts ?? -1)
        countersObject.friends = Int16(Lcounters.friends ?? -1)
        countersObject.onlineFriends = Int16(Lcounters.onlineFriends ?? -1)
        countersObject.userPhotos = Int16(Lcounters.userPhotos ?? -1)
        countersObject.followers = Int16(Lcounters.followers ?? -1)
        countersObject.subscriptions = Int16(Lcounters.subscriptions ?? -1)
        countersObject.pages = Int16(Lcounters.pages ?? -1)
        return countersObject
    }
    
}
