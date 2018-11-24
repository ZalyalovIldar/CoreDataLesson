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
    
    /// Return all entities of given type
    ///
    /// - Parameter type: type of models
    /// - Returns: the set of models
    func getAll<T: NSManagedObject>(with type: T.Type, predicate: (T) -> Bool) -> [T]?
    
    /// Return model grom database
    ///
    /// - Parameter type: type of model
    /// - Returns: the model
    func get<T: NSManagedObject>(with type: T.Type, predicate: (T) -> Bool) -> T?
    
    /// Update given model in database
    ///
    /// - Parameter model: model to save
    func update<T: NSManagedObject>(model: T) -> Void

    
    /// Add new model in database
    ///
    /// - Parameter model: model
    func delete<T: NSManagedObject>(model: T) -> Void
}
