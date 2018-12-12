//
//  ModelInteractor.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation

protocol ModelInteractor {
    
}

class ModelInteraction: ModelInteractor {
    
    var networkInteractor: NetworkInteractor
    var persistenceInteractor: PersistenceInteractor
    
    init(networkInteractor: NetworkInteractor, persistenceInteractor: PersistenceInteractor) {
        self.networkInteractor = networkInteractor
        self.persistenceInteractor = persistenceInteractor
    }
}

