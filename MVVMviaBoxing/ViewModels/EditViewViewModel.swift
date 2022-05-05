//
//  EditViewViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import Foundation

final class EditViewViewModel: EditViewViewModelProtocol {
    
    private(set) var binding: Box<Contact>
    private var storageService: StorageServiceProtocol = StorageService.shared
    
    init(data: Contact) {
        binding = Box(data)
    }
    
    public func saveData(name: String, lastName: String, birthday: Date, phone: String) -> Bool {

        binding.value.name = name
        binding.value.lastName = lastName
        binding.value.phoneNumber = phone
        binding.value.dateOfBirth = birthday
   
        if storageService.saveContext() {
            return true
        } else {
            return false
        }
    }
    
}
