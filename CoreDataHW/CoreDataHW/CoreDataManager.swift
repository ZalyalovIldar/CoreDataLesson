//
//  CoreDataManager.swift
//  homework2
//
//  Created by itisioslab on 21.01.2019.
//  Copyright © 2019 FirstGroupCompany. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager:CoreDataManagerProtocol{
    
    static let dbManager = CoreDataManager()
    
    
    
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
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataHW")
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
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    private init() {
        
        Randomizer.getAndSaveRandomNews(context: context)
    }
    
    func getAll<T>(with type: T.Type) -> [T]? where T : NSManagedObject {
        let request = (type.self).fetchRequest()
        
        let model = try? context.fetch(request) as! [T]
        
        return model
    }
    func asyncGetAll<T>(with type: T.Type, completionBlock: @escaping ([T]?) -> Void) where T : NSManagedObject {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            completionBlock(self.getAll(with: type))
        }
    }
    
    func get<T>(with type: T.Type) -> T? where T : NSManagedObject {
        let request = (type.self).fetchRequest()
        
        if let model = try? context.fetch(request) as! [T] {
            
            return model.count > 0 ? model.first : nil
        }
        
        return nil
    }
    
    func asyncGet<T>(with type: T.Type, completionBlock: @escaping (T?) -> Void) where T : NSManagedObject {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            completionBlock(self.get(with: type))
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
    
    func getAndSaveRandomNews(){
        Randomizer.getAndSaveRandomNews(context: context)
    }
    
}
