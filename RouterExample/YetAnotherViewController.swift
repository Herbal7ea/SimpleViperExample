//
//  NextViewController.swift
//  RouterExample
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit

class NextViewPresenter {
    func saveInfo() {
        print("💻 saving")
    }
}

class YetAnotherViewController: UIViewController {

    private var preseter: NextViewPresenter!
    private var navigationCoordinator: MainRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    public func prepare(preseter: NextViewPresenter, navigationCoordinator: MainRouter) {
        self.preseter = preseter
        self.navigationCoordinator = navigationCoordinator
    }
    
    @IBAction func doSomethingTapped(_ sender: Any) {
        preseter.saveInfo()
        navigationCoordinator.doSomethingTapped()
    }
    
    static var storyboardId = "YetAnotherViewController"
}

extension UIViewController {
    static var yetAnotherViewController = UIStoryboard.main.instantiateViewController(withIdentifier: YetAnotherViewController.storyboardId) as! YetAnotherViewController
}
