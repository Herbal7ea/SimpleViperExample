//
//  ModelInteractor.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation

public protocol ModelInteractor {
    
}

public class ModelInteraction: ModelInteractor {
    
    private var networkInteractor: NetworkInteractor
    private var persistenceInteractor: PersistenceInteractor
    
    public init(networkInteractor: NetworkInteractor, persistenceInteractor: PersistenceInteractor) {
        self.networkInteractor = networkInteractor
        self.persistenceInteractor = persistenceInteractor
    }
}

