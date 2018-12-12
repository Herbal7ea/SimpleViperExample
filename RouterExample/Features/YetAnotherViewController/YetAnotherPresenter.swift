//
//  YetAnotherPresenter.swift
//  RouterExample
//
//  Created by herbal7ea on 12/12/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation
import ModelFramework

class YetAnotherPresenter {
    
    private var modelInteractor: ModelInteractor
    
    init(modelInteractor: ModelInteractor) {
        self.modelInteractor = modelInteractor
    }
    
    func saveInfo() {
        print("💻 saving")
    }
}
