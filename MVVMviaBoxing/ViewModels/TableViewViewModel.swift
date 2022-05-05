//
//  TableViewViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 18.10.2021.
//

import Foundation

final class TableViewViewModel: TableViewViewModelProtocol {
    
    private(set) var binding: Box<[Contact]>
    private var storageService: StorageServiceProtocol = StorageService.shared
    
    init() {
        binding = Box([])
    }
    
    public func preloadDataFromStorage() {
        let array = storageService.fetchAllData(entityName: "Contact") as! [Contact]
        binding.value = array
    }
    
    public func deleteData(atIndex index: Int) -> Bool {
        let object = binding.value[index]
        
        if storageService.deleteObject(object: object) {
            binding.value.remove(at: index)
            return true
        } else {
            return false
        }
    }
}
