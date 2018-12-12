//
//  DependencyRegistry.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit
import SampleFramework

class DependencyRegistry {
    
    private var router: MainRouter
    private var rootNavigationController: UINavigationController!
    
    //Typically every view needs these pieces
    //so they are stateless singletons (should not be a memory concern)
    private var networkInteractor: NetworkInteractor = NetworkInteraction()
    private var persistenceInteractor: PersistenceInteractor = PersistenceInteraction()
    private lazy var modelInteractor: ModelInteractor = {
        return ModelInteraction(networkInteractor: self.networkInteractor, persistenceInteractor: self.persistenceInteractor)
    }()
    
    init(with rootNavigationController: UINavigationController, router: MainRouter) {
        self.rootNavigationController = rootNavigationController
        self.router = router
    }
}

// MARK: - Presenters
extension DependencyRegistry {

    private var firstViewPresenter: FirstViewPresenter {
        return FirstViewPresenter(modelInteractor: modelInteractor)
    }
    
    private var yetAnotherPresenter: YetAnotherPresenter {
        return YetAnotherPresenter(modelInteractor: modelInteractor)
    }
}

// MARK: - View Controllers
extension DependencyRegistry {
    
    public var firstViewController: FirstViewController {
        let vc = FirstViewController.newInstance
            vc.inject(presenter: firstViewPresenter, router: router)
        return vc
    }

    public var yetAnotherViewController: YetAnotherViewController {
        
        let vc = YetAnotherViewController.newInstance
            vc.inject(preseter: yetAnotherPresenter, navigationCoordinator: router)
        return vc
    }
}
