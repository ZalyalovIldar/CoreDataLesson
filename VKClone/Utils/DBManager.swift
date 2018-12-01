//
//  DataManager.swift
//  VKClone
//
//  Created by Петр on 18/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class DBManager: DBManagerProtocol {
    
    static let sharedInstance = DBManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VKClone")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    
    // MARK: - Constructor
    
    private init() {

        Generator.generateAndSaveRandomUser(context: context)
    }
    
    // MARK: - Methods to work with data
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func get<T>( with type: T.Type, predicate: (T) -> Bool ) -> T? where T : NSManagedObject {
        
        let request = T.fetchRequest()
        var result: [T] = []
        
        if let models = try? context.fetch(request) as! [T] {
            
            models.forEach{ if predicate($0) { result.append($0) } }
        }
        
        return result.count > 0 ? result.first : nil
    }

    func getAll<T>(with type: T.Type, predicate: (T) -> Bool ) -> [T]? where T : NSManagedObject {

        let request = (type.self).fetchRequest()
        var result: [T] = []
        
        if let models = try? context.fetch(request) as! [T] {
            
            models.forEach{ if predicate($0) { result.append($0) } }
        }
        
        return result
    }
    
    func update<T>(model: T) where T : NSManagedObject {
        
        let predicate = {(currentModel: T) -> Bool in return currentModel == model}
        
        if let oldModel = self.get(with: type(of: model), predicate: predicate) {
            
            context.delete(oldModel)
            self.saveContext()
            
            return
        }
    }

    func delete<T>(model: T) where T : NSManagedObject {
        
        context.delete(model)
        self.saveContext()
    }
    
    /// Generates random post and save it
    func generateAndSaveRandomPost() {
        Generator.generateAndSaveRandomPost(context: context)
    }
    
}
