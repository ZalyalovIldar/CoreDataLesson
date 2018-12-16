//
//  LikesObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class LikesObject: NSManagedObject {

    static func transfrom(_ like: Likes?) -> LikesObject? {
        guard let Llike = like else { return nil }
        let likesObject = LikesObject(context: DataManagerImplementation.sharedInstance.getContext())
        likesObject.count = Int32(Llike.count ?? -1)
        likesObject.userLikes = Int16(Llike.userLikes ?? -1)
        likesObject.canLike = Int16(Llike.canLike ?? -1)
        likesObject.canPublish = Int16(Llike.canPublish ?? -1)
        return likesObject
    }
    
    
}
