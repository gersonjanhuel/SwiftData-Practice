//
//  Person.swift
//  SwiftData-Practice
//
//  Created by Gerson Janhuel on 01/07/24.
//

import SwiftData

@Model
class Person {
    var name: String
    var age: Int
    
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
}
