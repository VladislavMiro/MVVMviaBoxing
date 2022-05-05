//
//  TableViewCellViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 19.10.2021.
//

import Foundation

final class TableViewCellViewModel: TableViewCellViewModelProtocol {
    
    private(set) var fullName: Box<String>
    
    init(name: String, lastName: String) {
        fullName = Box<String>(name + " " + lastName)
    }
    
}
