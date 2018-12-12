//
//  NavigationCoordinator.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit
import SampleFramework

class MainRouter {
    
    //Singleton for now - If using swingject, this typically lives outside of the Dependency Repository
    static var shared = MainRouter()
    
    private var registry: DependencyRegistry!
    private var rootNavigationController: UINavigationController!
    
    private var sampleRouter: SampleFrameworkRouter?

    
    func initialize(with rootNavigationController: UINavigationController, registry: DependencyRegistry) {
        self.rootNavigationController = rootNavigationController
        self.registry = registry
    }
    
    func goToNextView() {
        rootNavigationController.dismiss(animated: true) {
            self.goToAnotherView()
        }
    }
    
    func goToAnotherView() {
        let vc = registry.yetAnotherViewController
        rootNavigationController.present(vc, animated: true)
    }
    
    func showFirstViewController() {
        let vc = registry.firstViewController
        rootNavigationController.pushViewController(vc, animated: false)
    }
}

//MARK: - UI Events
extension MainRouter {
    func doSomethingTapped() {
        print("Some Action from the Router 🦄🎉")
    }
    
    func handleLaunchSampleTapped(_ someSampleInfoToPassOn: String) {
        let someLaunchingViewController = rootNavigationController! //could be a different VC
        
        self.sampleRouter = SampleFrameworkRouterImpl(with: someLaunchingViewController)
        
        sampleRouter!.beginSampleFlow(someSampleInfoToPassOn) {
            print("done 🎉")
            self.goToNextView()
        }
    }
}

extension UIStoryboard {
    static var main = UIStoryboard(name: "Main", bundle: nil)
}
