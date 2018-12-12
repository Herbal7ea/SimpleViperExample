//
//  NextViewController.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit

class YetAnotherViewController: UIViewController {

    private var preseter: YetAnotherPresenter!
    private var navigationCoordinator: MainRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    public func inject(preseter: YetAnotherPresenter, navigationCoordinator: MainRouter) {
        self.preseter = preseter
        self.navigationCoordinator = navigationCoordinator
    }
    
    @IBAction func doSomethingTapped(_ sender: Any) {
        preseter.saveInfo()
        navigationCoordinator.doSomethingTapped()
    }
    
    static var storyboardId = "YetAnotherViewController"
}

extension YetAnotherViewController {
    static var newInstance: YetAnotherViewController {
        return UIViewController.yetAnotherViewController
    }
}

//example of using a storyboard instead of a xib
private extension UIViewController {
    static var yetAnotherViewController = UIStoryboard.main.instantiateViewController(withIdentifier: YetAnotherViewController.storyboardId) as! YetAnotherViewController
}
