//
//  PhotoObject+CoreDataClass.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//
//

import Foundation
import CoreData


public class PhotoObject: NSManagedObject {

    
    static func transfrom(_ photo: Photo?) -> PhotoObject? {
        guard let Lphoto = photo else { return nil }
        let photoObject = PhotoObject(context: DataManagerImplementation.sharedInstance.getContext())
        photoObject.id = Int32(Lphoto.id ?? -1)
        photoObject.accessKey = Lphoto.accessKey
        if let date = Lphoto.date {
            photoObject.date = date as NSDate
        }
        photoObject.photoSizeObject = PhotoSizeObject.transfrom(photo?.photoSize ?? [])
        
        return photoObject
    }
}
