//
//  NavigationCoordinator.swift
//  SampleFramework
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation

public typealias EmptyClosure = () -> Void

public protocol SampleFrameworkRouter {
    func beginSampleFlow(_ someSampleInfoToPassOn: String, onFinished: @escaping EmptyClosure)
    func sampleViewControllerDoneTapped()
}

public class SampleFrameworkRouterImpl: SampleFrameworkRouter {

    private var rootNavigationController: UINavigationController
    private var onFinished: EmptyClosure!
    
    private lazy var registry = {
        return DependencyRegistry(rootNavigationController: self.rootNavigationController, router: self)
    }()
    
    public init(with rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    public func beginSampleFlow(_ someSampleInfoToPassOn: String, onFinished: @escaping EmptyClosure) {
        self.onFinished = onFinished
        
        let vc = registry.sampleViewController
        rootNavigationController.present(vc, animated: true)
    }
    
    public func sampleViewControllerDoneTapped() {
        onFinished()
    }
}
