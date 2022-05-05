//
//  AddContactViewViewModelProtocol.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import Foundation

protocol AddContactViewViewModelProtocol {
    
    func saveContact(name: String, lastName: String, birthday: Date, phone: String) -> Bool
    
}
