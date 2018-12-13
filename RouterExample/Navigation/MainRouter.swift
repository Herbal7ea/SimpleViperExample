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
    
    private lazy var registry: DependencyRegistry = {
        DependencyRegistry(with: rootNavigationController, router: self)
    }()
    
    private var rootNavigationController: UINavigationController!
    
    private var sampleRouter: SampleFrameworkRouter?

    private var currentViewController: UIViewController?

    public var firstViewController: UIViewController {
        return registry.firstViewController
    }
    
    func initialize(with rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    func goToNextView() {
        rootNavigationController.dismiss(animated: true) {
            self.goToAnotherView()
        }
    }
    
    func goToAnotherView() {
        currentViewController = registry.yetAnotherViewController
        rootNavigationController.present(currentViewController!, animated: true)
    }
}

//MARK: - UI Events
extension MainRouter {
    func doSomethingTapped() {
        print("Some Action from the Router 🦄🎉")
        currentViewController?.dismiss(animated: true)
    }
    
    func handleLaunchSampleTapped(_ someSampleInfoToPassOn: String) {
        let someLaunchingViewController = rootNavigationController! //could be a different VC
        
        self.sampleRouter = SampleFrameworkRouterImpl(with: someLaunchingViewController)
        
        sampleRouter!.beginSampleFlow(someSampleInfoToPassOn, onFinished: {
            print("done 🎉")
            self.goToNextView()
            
            //clean up unused Routers
            self.sampleRouter = nil
        })
    }
}

extension UIStoryboard {
    static var main = UIStoryboard(name: "Main", bundle: nil)
}
