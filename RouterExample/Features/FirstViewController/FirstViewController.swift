//
//  FirstViewController.swift
//  RouterExample
//
//  Created by herbal7ea on 12/12/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit




class FirstViewController: UIViewController {

    private var presenter: FirstViewPresenter!
    private var navigationCoordinator: MainRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func inject(presenter: FirstViewPresenter, router: MainRouter) {
        self.presenter = presenter
        self.navigationCoordinator = router
    }
    
    @IBAction func launchSampleTapped(_ sender: Any) {
        let someSampleInfoToPassOn = "I❤🦄"
        navigationCoordinator.handleLaunchSampleTapped(someSampleInfoToPassOn)
    }
}

//MARK: - Static Methods
extension FirstViewController {
    static var newInstance: FirstViewController {
        return FirstViewController(nibName: FirstViewController.nibName, bundle: nil)
    }
    
    static var nibName: String = "FirstViewController"
}


