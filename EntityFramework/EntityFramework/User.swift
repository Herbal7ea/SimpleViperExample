//
//  User.swift
//  EntityFramework
//
//  Created by herbal7ea on 12/12/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation

public class User: Codable {
    public var firstName: String
    public var lastName: String
    public var age: String
    
    public init(firstName: String, lastName: String, age: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
