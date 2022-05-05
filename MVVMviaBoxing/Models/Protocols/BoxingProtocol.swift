//
//  BoxingProtocol.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 18.10.2021.
//

import Foundation

protocol BoxingProtocol {
    
    associatedtype DataType
    
    typealias Listener = (DataType) -> ()
    
    var listener: Listener? { get }
    var value: DataType { get }
    
    init(_ value: DataType)
    
    func bind(listener: @escaping Listener)
    
}
