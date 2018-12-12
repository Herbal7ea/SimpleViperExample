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
    
    private var rootNavigationController: UINavigationController!
    
    private var sampleFrameworkNavigationCoordinator: SampleFrameworkRouter?

    
    func initialize(with rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    func goToNextView() {
        rootNavigationController.dismiss(animated: true) {
            self.goToAnotherView()
        }
    }
    
    func goToAnotherView() {
        let vc = DependencyRegistry.shared.yetAnotherViewController
        rootNavigationController.present(vc, animated: true)
    }
    
    func showFirstViewController() {
        let vc = DependencyRegistry.shared.firstViewController
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
        
        sampleFrameworkNavigationCoordinator = SampleFrameworkNavigationCoordination(with: someLaunchingViewController)
        sampleFrameworkNavigationCoordinator!.beginSampleFlow(someSampleInfoToPassOn) {
            print("done 🎉")
            self.goToNextView()
        }
    }
}

extension UIStoryboard {
    static var main = UIStoryboard(name: "Main", bundle: nil)
}
