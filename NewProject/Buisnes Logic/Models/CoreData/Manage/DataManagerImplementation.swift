//
//  DataManagerImplementation.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation
import CoreData

class DataManagerImplementation: DataManager {
    
    static let sharedInstance = DataManagerImplementation()
    
    // MARK: - Core Data stack
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data Saving support
    
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
    
    
    // MARK: - DataManager protocol
    
    func delete<T>(managedObject: T) where T: NSManagedObject {
        persistentContainer.viewContext.delete(managedObject)
        saveContext()
    }
    
    
    func get<T>(with type: T.Type, predicate: NSPredicate?) -> [T]? where T: NSManagedObject {
        let request = T.fetchRequest()
        request.predicate = predicate
        do {
            return  try persistentContainer.viewContext.fetch(request) as? [T]
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func saveAll() {
        saveContext()
    }
    
    func getContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func delete<T>(with type: T.Type, predicate: NSPredicate?) where T: NSManagedObject {
        let fetchRequest = T.fetchRequest()
        fetchRequest.predicate = predicate
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            saveContext()
        } catch {
            print(error)
            return
        }
    }
}
