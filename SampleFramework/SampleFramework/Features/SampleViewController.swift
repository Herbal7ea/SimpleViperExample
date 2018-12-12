//
//  SampleViewController.swift
//  SampleFramework
//
//  Created by herbal7ea on 12/11/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import UIKit
import EntityFramework

public class SampleViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    
    private var presenter: SamplePresenter!
    private var navigationCoordinator: SampleFrameworkRouter!
    
    public func inject(_ presenter: SamplePresenter, _ navigationCoordinator: SampleFrameworkRouter) {
        self.presenter = presenter
        self.navigationCoordinator = navigationCoordinator
        
        initData()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    func initData() {
        presenter.getUser { [weak self] user in
            guard let strongSelf = self else { return }
            
            strongSelf.userLabel.text = user.firstName
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        navigationCoordinator.sampleViewControllerDoneTapped()
    }
}

//MARK: - Static Methods
extension SampleViewController {
    public static func newInstance(presenter: SamplePresenter, navigationCoordinator: SampleFrameworkRouter) -> SampleViewController {
        let bundle = SampleViewController.bundle
        let nibName = SampleViewController.nibName
        let vc = SampleViewController(nibName: nibName, bundle: bundle)
            vc.inject(presenter, navigationCoordinator)
        return vc
    }
    
    public static var nibName: String = "SampleViewController"
    
    public static let bundle = Bundle(identifier: "com.jonbott.SampleFramework")
}
