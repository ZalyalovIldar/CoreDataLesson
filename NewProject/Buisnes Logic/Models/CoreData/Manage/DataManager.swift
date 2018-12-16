//
//  DataManager.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import CoreData
import UIKit

protocol DataManager {
    
    /// Удаление объекта из базы данных
    ///
    /// - Parameter managedObject: тип объекта
    func delete<T>(managedObject: T) where T: NSManagedObject
    
    /// Получение массива объектов отфильтрованных предикатом
    ///
    /// - Parameters:
    ///   - type: тип объекта
    ///   - predicate: request predicate
    /// - Returns: массива объектов
    func get<T: NSManagedObject>(with type: T.Type, predicate: NSPredicate?) -> [T]?
    
    /// Сохранение всех изменений в базе данных
    func saveAll()
    
    
    /// Получение текущего контекста
    ///
    /// - Returns: контекст
    func getContext()-> NSManagedObjectContext
    
    
    func delete<T>(with type: T.Type, predicate: NSPredicate?) where T: NSManagedObject
    
}
