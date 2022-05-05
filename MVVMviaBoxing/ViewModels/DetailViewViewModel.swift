//
//  DetailViewViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import Foundation

final class DetailViewViewModel: DetailViewViewModelProtocol {
    
    private(set) var data: Box<Contact>
    
    init(contact: Contact) {
        data = Box<Contact>(contact)
    }
    
}
