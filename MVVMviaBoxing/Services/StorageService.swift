
//
//  StorageService.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 19.10.2021.
//

import Foundation
import CoreData

final class StorageService {
    
    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MVVMviaBoxing1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    public static var shared = StorageService()
    
    private init() { }
    
}

extension StorageService:  StorageServiceProtocol {
    
    public func fetchData(entityName: String, withPredicate predicate: NSPredicate) -> [NSManagedObject] {
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: entityName)
            var values = [NSManagedObject]()
            
            fetchRequest.predicate = predicate
                
            do {
                values = try context.fetch(fetchRequest)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            return values
        }
        
    public func fetchData(byID id: NSManagedObjectID) -> NSManagedObject {
        return context.object(with: id)
    }
        
    public func fetchAllData(entityName: String) -> [NSManagedObject] {
        return fetchData(entityName: entityName, withPredicate: NSPredicate(value: true))
    }
    
    public func createNewEntity(forEntityName name: String) -> NSManagedObject {
        let entity = NSEntityDescription.insertNewObject(forEntityName: name, into: context)
        return entity
    }
    
    public func deleteObject(object: NSManagedObject) -> Bool {
        context.delete(object)
        return saveContext()
    }
    
    public func saveContext() -> Bool {
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                let error = error as NSError
                
                print("Unresolved error \(error), \(error.userInfo)")
                
                context.rollback()
                
                return false
            }
        }
                
        return true
    }
    
}
