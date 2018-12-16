//
//  AttachmentObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class AttachmentObject: NSManagedObject {

    
    static func transfrom(_ attachmentsArr: [Attachment]) -> Set<AttachmentObject> {
        guard attachmentsArr.count > 0  else { return [] }
        var result = [AttachmentObject]()
        for (_, item) in attachmentsArr.enumerated() {
            let attachmentObject = AttachmentObject(context: DataManagerImplementation.sharedInstance.getContext())
            attachmentObject.type = item.type
            attachmentObject.photoObject = PhotoObject.transfrom(item.photo)
            result.append(attachmentObject)
        }
        return Set(result)
}
}
