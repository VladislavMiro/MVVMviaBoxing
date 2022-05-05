//
//  TableViewViewModelProtocol.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 18.10.2021.
//

import Foundation

protocol TableViewViewModelProtocol {
    var binding: Box<[Contact]> { get }
    
    func preloadDataFromStorage()
    func deleteData(atIndex index: Int) -> Bool
}
