//
//  AddContactViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 19.10.2021.
//

import Foundation

final class AddContactViewModel: AddContactViewViewModelProtocol {

    private var storageService: StorageServiceProtocol = StorageService.shared
    
    public func saveContact(name: String, lastName: String, birthday: Date, phone: String) -> Bool {
        guard let contact = storageService.createNewEntity(forEntityName: "Contact") as? Contact else { return false }
        
        contact.name = name
        contact.lastName = lastName
        contact.dateOfBirth = birthday
        contact.phoneNumber = phone
        
        if storageService.saveContext() {
            return true
        } else {
            return false
        }
    }
    
}
