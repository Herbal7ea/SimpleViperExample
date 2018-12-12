//
//  NetworkInteractor.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation
import EntityFramework

public typealias UserResultClosure = (User) -> Void

public protocol NetworkInteractor {
    func getUser(for id: String, onResult: @escaping UserResultClosure)
}

public class NetworkInteraction: NetworkInteractor {
    public init() {
        
    }
    
    public func getUser(for id: String, onResult: @escaping UserResultClosure) {
        //fake process for now
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
            let user = User(firstName: "Naruto", lastName: "Uzumaki", age: "35")
            
            onResult(user)
        }
    }
}
