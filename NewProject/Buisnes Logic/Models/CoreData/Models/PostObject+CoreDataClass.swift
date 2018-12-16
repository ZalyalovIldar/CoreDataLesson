//
//  PostObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class PostObject: NSManagedObject {
    
    static func transfrom(_ postsArr: [Post]) -> [PostObject] {
        guard postsArr.count > 0  else { return [] }
        var result = [PostObject]()
        for (_, item) in postsArr.enumerated() {
            let postOject = PostObject(context: DataManagerImplementation.sharedInstance.getContext())
            postOject.id = Int64(item.id ?? -1)
            if let date = item.date {
                postOject.date = date as NSDate
            }
            postOject.postType = item.postType
            postOject.text = item.text
            postOject.likes = LikesObject.transfrom(item.likes)
            postOject.attachments = AttachmentObject.transfrom(item.attachments ?? [])
            
            result.append(postOject)
        }
        
        return result
    }

}
