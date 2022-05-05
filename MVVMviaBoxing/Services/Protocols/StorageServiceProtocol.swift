//
//  StorageService.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 19.10.2021.
//

import Foundation
import CoreData

protocol StorageServiceProtocol {
    
    var persistentContainer: NSPersistentContainer { get }
    var context: NSManagedObjectContext { get }
    
    func createNewEntity(forEntityName name: String) -> NSManagedObject
    func fetchData(entityName: String, withPredicate predicate: NSPredicate) -> [NSManagedObject]
    func fetchData(byID id: NSManagedObjectID) -> NSManagedObject
    func fetchAllData(entityName: String) -> [NSManagedObject]
    func deleteObject(object: NSManagedObject) -> Bool
    func saveContext() -> Bool
    
}
