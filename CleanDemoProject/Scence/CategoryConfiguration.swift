//
//  CategoryConfiguration.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
protocol CategoryConfigurationProtocol {
    func configurationCategory(vc:CategoryListController)
}
class CategoryConfiguration:CategoryConfigurationProtocol  {
    func configurationCategory(vc: CategoryListController) {
        let apiClient = ApiClientImplentation.init(session:URLSession.shared)
        let envolp =  ServicePath.Patient()


        let catApiGateWay = CategoryApiGateWayImplemenation.init(apiClient: apiClient, request: envolp.httpBodyEnvelop()!)
        let catTestCase = CategoryUseCaseImplemenation.init(gateWay:catApiGateWay)
        let router = CategoryRouterImplementation.init(catViewController:vc)
        let presenter = CategeoryPresente.init(catView: vc, router: router, catDisplay: catTestCase)
        vc.presenter = presenter
    
        
        
        
        
    }
}
