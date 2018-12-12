//
//  MainViewController.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegistry()
        MainRouter.shared.showFirstViewController()
    }
    
    //only happens in first view
    func setupRegistry() {
        DependencyRegistry.shared.initialize(with: navigationController!)
    }
}

