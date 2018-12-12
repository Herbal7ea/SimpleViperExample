//
//  DependencyRegistry.swift
//  SampleFramework
//
//  Created by herbal7ea on 12/12/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit

class DependencyRegistry {
    
    private var router: SampleFrameworkRouter!
    private var rootNavigationController: UINavigationController!
    
//    //Typically every view needs these pieces
//    //so they are stateless singletons (should not be a memory concern)
//    private var networkInteractor: NetworkInteractor = NetworkInteraction()
//    private var persistenceInteractor: PersistenceInteractor = PersistenceInteraction()
//    private lazy var modelInteractor: ModelInteractor = {
//        return ModelInteraction(networkInteractor: self.networkInteractor, persistenceInteractor: self.persistenceInteractor)
//    }()
    
    init(rootNavigationController: UINavigationController, router: SampleFrameworkRouter) {
        self.router = router
        self.rootNavigationController = rootNavigationController
    }

}

// MARK: - Presenters
extension DependencyRegistry {
    
    private var samplePresenter: SamplePresenter {
        return SamplePresenter()
    }
}

// MARK: - View Controllers
extension DependencyRegistry {
    
    public var sampleViewController: SampleViewController {
        let vc = SampleViewController.newInstance(presenter: samplePresenter, navigationCoordinator: router)
        return vc
    }
}

