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
    
    // MARK: - Operation queues
    
    private lazy var updateOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.name = "Update model operation queue"
        
        return queue
    }()
    
    private lazy var deleteOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.name = "Delete model operation queue"
        
        return queue
    }()
    
    
    // MARK: - Core Data stack
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VKClone")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    private func saveContext () {
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
    
    
    // MARK: - Constructor
    
    private init() {

        Generator.generateAndSaveRandomUser(context: context)
    }
    
    
    // MARK: - Methods to work with data

    func get<T>( with type: T.Type) -> T? where T : NSManagedObject {
        
        let request = (type.self).fetchRequest()
        
        if let models = try? context.fetch(request) as! [T] {
            
            return models.count > 0 ? models.first : nil
        }
        
        return nil
    }
    
    func asyncGet<T>(with type: T.Type, completionBlock: @escaping (T?) -> Void) where T : NSManagedObject {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            completionBlock(self.get(with: type))
        }
    }
    

    func getAll<T>(with type: T.Type) -> [T]? where T : NSManagedObject {

        let request = (type.self).fetchRequest()
        
        let models = try? context.fetch(request) as! [T]
        
        return models
    }
    
    func asyncGetAll<T>(with type: T.Type, completionBlock: @escaping ([T]?) -> Void) where T : NSManagedObject {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            completionBlock(self.getAll(with: type))
        }
    }
    
    func update<T>(model: T) where T : NSManagedObject {
                
        if let oldModel = self.get(with: type(of: model)) {
            
            context.delete(oldModel)
            self.saveContext()
            
            return
        }
    }
    
    func asyncUpdate<T>(model: T, completionBlock: @escaping (Bool) -> Void) where T : NSManagedObject {
        
        updateOperationQueue.addOperation {
            
            self.update(model: model)
            completionBlock(true)
        }
        
    }

    func delete<T>(model: T) where T : NSManagedObject {
        
        context.delete(model)
        self.saveContext()
    }
    
    func asyncDelete<T>(model: T, completionBlock: @escaping (Bool) -> Void) where T : NSManagedObject {
        
        deleteOperationQueue.addOperation {
            
            self.delete(model: model)
            completionBlock(true)
        }
    }
    
    /// Generates random post and save it
    func generateAndSaveRandomPost() {
        Generator.generateAndSaveRandomPost(context: context)
    }
    
}
