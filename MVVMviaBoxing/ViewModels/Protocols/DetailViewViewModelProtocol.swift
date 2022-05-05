//
//  DetailViewModelProtocol.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import Foundation

protocol DetailViewViewModelProtocol {
    var data: Box<Contact> { get }
}
