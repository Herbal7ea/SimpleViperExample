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
    
    private var navigationCoordinator: MainRouter!
    private var rootNavigationController: UINavigationController!
    
    func initialize(with rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        self.navigationCoordinator = MainRouter.shared
        
        navigationCoordinator.initialize(with: rootNavigationController)
    }
    
    func prepare(_ mainViewController: MainViewController) {
        mainViewController.inject(navigationCoordinator: navigationCoordinator)
    }
}
