//
//  Box.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 18.10.2021.
//

import Foundation

final class Box<T>: BoxingProtocol {
    
    typealias DataType = T
    
    public var listener: Listener?
    
    public var value: DataType {
        didSet {
            listener?(value)
        }
    }
    
    required init(_ value: DataType) {
        self.value = value
    }
    
    public func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }

}
