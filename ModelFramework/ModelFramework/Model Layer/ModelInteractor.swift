//
//  ModelInteractor.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation

public protocol ModelInteractor {
    func getUser(for id: String, onResult: @escaping UserResultClosure)
}

public class ModelInteraction: ModelInteractor {
    
    private var networkInteractor: NetworkInteractor
    private var persistenceInteractor: PersistenceInteractor
    
    public init(networkInteractor: NetworkInteractor, persistenceInteractor: PersistenceInteractor) {
        self.networkInteractor = networkInteractor
        self.persistenceInteractor = persistenceInteractor
    }
    
    public func getUser(for id: String, onResult: @escaping UserResultClosure) {
        
        self.networkInteractor.getUser(for: id) { user in
            
            //Model Layer responsible for returning to the main thread after data has been prepared
            DispatchQueue.main.async {
                onResult(user)
            }
        }
    }
}

