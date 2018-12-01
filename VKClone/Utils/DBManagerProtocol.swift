//
//  DataProtocol.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation
import CoreData

// Protocol for working with data
protocol DBManagerProtocol {
    
    /// Returns all entities of given type
    ///
    /// - Parameter type: type of models
    /// - Returns: the set of models
    func getAll<T: NSManagedObject>(with type: T.Type) -> [T]?
    
    /// Asynchronously returns all entities of given type
    ///
    /// - Parameter
    ///   - type: type of models
    ///   - completionBlock: block for returning models
    /// - Returns: the set of models
    func asyncGetAll<T: NSManagedObject>(with type: T.Type, completionBlock: @escaping ([T]?) -> Void)
    
    /// Returns model grom database
    ///
    /// - Parameter type: type of model
    /// - Returns: the model
    func get<T: NSManagedObject>(with type: T.Type) -> T?
    
    /// Asynchronously returns model grom database
    ///
    /// - Parameter
    ///   - type: type of model
    ///   - completionBlock: block for returning models
    /// - Returns: the model
    func asyncGet<T: NSManagedObject>(with type: T.Type, completionBlock: @escaping (T?) -> Void)
    
    /// Updates given model in database
    ///
    /// - Parameter model: model to save
    func update<T: NSManagedObject>(model: T) -> Void

    /// Asynchronously updates given model in database
    ///
    /// - Parameters:
    ///   - model: model to delete
    ///   - completionBlock: for returing result of operations
    func asyncUpdate<T: NSManagedObject>(model: T, completionBlock: @escaping (Bool) -> Void)
    
    /// Adds new model in database
    ///
    /// - Parameter model: model
    func delete<T: NSManagedObject>(model: T) -> Void
    
    /// Asynchronously adds new model in database
    ///
    /// - Parameters:
    ///   - model: model to delete
    ///   - completionBlock: for returing result of operations
    func asyncDelete<T: NSManagedObject>(model: T, completionBlock: @escaping (Bool) -> Void)
}
