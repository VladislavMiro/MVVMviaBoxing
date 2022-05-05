//
//  EditViewViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import Foundation

protocol EditViewViewModelProtocol {
    
    var binding: Box<Contact> { get }

    func saveData(name: String, lastName: String, birthday: Date, phone: String) -> Bool
    
}
