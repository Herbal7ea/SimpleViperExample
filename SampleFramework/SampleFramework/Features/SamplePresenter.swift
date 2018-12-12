//
//  SamplePresenter.swift
//  SampleFramework
//
//  Created by herbal7ea on 12/12/18.
//  Copyright © 2018 Jon Bott. All rights reserved.
//

import Foundation
import ModelFramework
import EntityFramework

public class SamplePresenter {
    private var modelInteractor: ModelInteractor
    
    init(modelInteractor: ModelInteractor) {
        self.modelInteractor = modelInteractor
    }
    
    func getUser(onResult: @escaping UserResultClosure) {
        let id = "someId"

        modelInteractor.getUser(for: id) { user in
            //do something
            print("want a 🦄?")
            
            //notify view
            //a good place for RxSwift instead of closure... 😉
            onResult(user)
        }
    }
}
