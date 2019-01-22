//
//  CoreDataManagerProtocol.swift
//  homework2
//
//  Created by itisioslab on 18.01.2019.
//  Copyright © 2019 FirstGroupCompany. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    
    func getAll<T: NSManagedObject>(with type: T.Type) -> [T]?
    
    func get<T: NSManagedObject>(with type: T.Type) -> T?
    
    func update<T: NSManagedObject>(model: T) -> Void
    
    func delete<T: NSManagedObject>(model: T) -> Void
 
    func asyncGetAll<T: NSManagedObject>(with type: T.Type, completionBlock: @escaping ([T]?) -> Void)
    
    func asyncGet<T: NSManagedObject>(with type: T.Type, completionBlock: @escaping (T?) -> Void)
    
    func asyncUpdate<T: NSManagedObject>(model: T, completionBlock: @escaping (Bool) -> Void)
    
    func asyncDelete<T: NSManagedObject>(model: T, completionBlock: @escaping (Bool) -> Void)
    
    func getAndSaveRandomNews()
    
}
