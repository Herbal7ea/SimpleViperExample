//
//  MainViewController.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private var navigationCoordinator: MainRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegistry()
        DependencyRegistry.shared.prepare(self)
    }
    
    //only happens in first view
    func setupRegistry() {
        DependencyRegistry.shared.initialize(with: navigationController!)
    }
    
    func inject(navigationCoordinator: MainRouter) {
        self.navigationCoordinator = navigationCoordinator
    }

    @IBAction func launchSampleTapped(_ sender: Any) {
        let someSampleInfoToPassOn = "I❤🦄"
        navigationCoordinator.handleLaunchSampleTapped(someSampleInfoToPassOn)
    }
}

