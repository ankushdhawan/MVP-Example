//
//  CategoryUseCaseImplemenation.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 07/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
typealias DisplayCategoryUseCaseCompletionHandler = (_ category: Result<[Category]>) -> Void

protocol DisplayCategoryUseCase {
    func displayBooks(completionHandler: @escaping DisplayCategoryUseCaseCompletionHandler)
}

class CategoryUseCaseImplemenation: DisplayCategoryUseCase {
    var gateWay:CategoryGateWay
    init(gateWay:CategoryGateWay) {
        self.gateWay = gateWay
    }
    
    func displayBooks(completionHandler: @escaping DisplayCategoryUseCaseCompletionHandler) {
        gateWay.fetchBooks { (result: Result<[Category]>)  in
            switch result {
            case let .success(response):
            completionHandler(.success(response))
                    break
                
            case let .failure(error):
                completionHandler(.failure(error))
                break
            }
            
        }
    }
    
    
}
