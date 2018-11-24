//
//  Post+CoreDataProperties.swift
//  VKClone
//
//  Created by Петр on 19/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//
//

import Foundation
import CoreData


extension Post {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    // Count of comments
    @NSManaged public var commentsCount: Int32
    
    // Avatar link
    @NSManaged public var groupAvatar: String?
    
    // Group name
    @NSManaged public var groupName: String?
    
    // Identificator
    @NSManaged public var id: UUID!
    
    // Count of likes
    @NSManaged public var likesCount: Int32
    
    // Date of post
    @NSManaged public var postDate: String?
    
    // Post image link
    @NSManaged public var postImageLink: String?
    
    // Post text
    @NSManaged public var postText: String?
    
    // Count of viewers
    @NSManaged public var viewsCount: Int32
    
    // Save model in database
    func save(context: NSManagedObjectContext) {
        try? context.save()
    }

}
