//
//  PostObject+CoreDataProperties.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


extension PostObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostObject> {
        return NSFetchRequest<PostObject>(entityName: "PostObject")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var id: Int64
    @NSManaged public var postType: String?
    @NSManaged public var text: String?
    @NSManaged public var attachments: Set<AttachmentObject>?
    @NSManaged public var likes: LikesObject?

}

// MARK: Generated accessors for attachments
extension PostObject {

    @objc(addAttachmentsObject:)
    @NSManaged public func addToAttachments(_ value: AttachmentObject)

    @objc(removeAttachmentsObject:)
    @NSManaged public func removeFromAttachments(_ value: AttachmentObject)

    @objc(addAttachments:)
    @NSManaged public func addToAttachments(_ values: NSSet)

    @objc(removeAttachments:)
    @NSManaged public func removeFromAttachments(_ values: NSSet)

}
