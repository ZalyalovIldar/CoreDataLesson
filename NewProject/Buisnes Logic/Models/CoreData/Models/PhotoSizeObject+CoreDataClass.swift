//
//  PhotoSizeObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class PhotoSizeObject: NSManagedObject {

    static func transfrom(_ photosArr: [PhotoSize]) -> Set<PhotoSizeObject> {
        guard photosArr.count > 0  else { return [] }
        var result = [PhotoSizeObject]()
        for (_, item) in photosArr.enumerated() {
            let photoSizeObject = PhotoSizeObject(context: DataManagerImplementation.sharedInstance.getContext())
            photoSizeObject.type = item.type
            photoSizeObject.url = item.url
            photoSizeObject.width = Int16(item.width ?? 0)
            photoSizeObject.height = Int16(item.height ?? 0)
            result.append(photoSizeObject)
        }
        return Set(result)
    }
    
}
