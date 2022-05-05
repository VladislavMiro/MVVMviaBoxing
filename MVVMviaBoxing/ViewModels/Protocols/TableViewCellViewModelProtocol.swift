//
//  TabelViewCellViewModel.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import Foundation

protocol TableViewCellViewModelProtocol {
    
    var fullName: Box<String> { get }
    
}
