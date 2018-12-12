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
    
    static var shared = DependencyRegistry()
    
    private var router: MainRouter!
    private var rootNavigationController: UINavigationController!
    
    private var networkInteractor: NetworkInteractor = NetworkInteraction()
    private var persistenceInteractor: PersistenceInteractor = PersistenceInteraction()
    private var modelInteractor: ModelInteractor {
        return ModelInteraction(networkInteractor: self.networkInteractor, persistenceInteractor: self.persistenceInteractor)
    }

    // MARK: - Presenters
    private var firstViewPresenter: FirstViewPresenter {
        return FirstViewPresenter(modelInteractor: modelInteractor)
    }
    
    private var yetAnotherPresenter: YetAnotherPresenter {
        return YetAnotherPresenter()
    }

    // MARK: - View Controllers
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
    
    func initialize(with rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        self.router = MainRouter.shared
        
        router.initialize(with: rootNavigationController)
    }
    
}
