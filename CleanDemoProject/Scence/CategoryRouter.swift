//
//  CategoryRouter.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit
protocol viewRouter {
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    
}
extension viewRouter
{
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
    }
}

protocol CategoryRouter:viewRouter {
    func navigateCategoryDetailVC(cat:Category)
}
class CategoryRouterImplementation: CategoryRouter {
   
    
    var catVC:CategoryListController?
    var catModel:Category?
    init(catViewController: CategoryListController) {
        self.catVC = catViewController
    }
    func navigateCategoryDetailVC(cat: Category) {
        catModel = cat
        catVC?.performSegue(withIdentifier:"CategoryListController", sender: nil)    }
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
    }
}
