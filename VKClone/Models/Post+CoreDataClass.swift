//
//  Post+CoreDataClass.swift
//  VKClone
//
//  Created by Петр on 19/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Post)
public class Post: NSManagedObject {
    

    convenience init( context: NSManagedObjectContext, id: UUID, groupName: String, groupAvatar: String, postDate: String, postText: String, postImageLink: String, likesCount: Int, commentsCount: Int, viewsCount: Int) {
        
        self.init(context: context)
        
        self.id = id
        self.groupName = groupName
        self.groupAvatar = groupAvatar
        self.postDate = postDate
        self.postText = postText
        self.postImageLink = postImageLink
        self.likesCount = Int32(likesCount)
        self.commentsCount = Int32(commentsCount)
        self.viewsCount = Int32(viewsCount)
    }
}
