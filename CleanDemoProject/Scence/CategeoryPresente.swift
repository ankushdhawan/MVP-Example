//
//  CategeoryPresenterViewController.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit
protocol CategeoryPresenterProtocol {
    var numberOFRow:Int{
        get
    }
    var router:CategoryRouter{
        get
    }
    func didSelectRow(cell:UITableViewCell,index:NSIndexPath)
    func viewDidLoad()
    func cellRowIndexPath(cell:CatTableViewCell,index:NSIndexPath)
    func refreshTable()

}
class CategeoryPresente: CategeoryPresenterProtocol {
    var router: CategoryRouter
    var catView:CategoryView?
    var catDisplay:DisplayCategoryUseCase
    var numberOFRow: Int = 0
    var category = [Category]()
    init(catView:CategoryView,router: CategoryRouter,catDisplay:DisplayCategoryUseCase) {
        self.catView = catView
        self.router = router
        self.catDisplay = catDisplay
    }
    
    
    func refreshTable() {
        catView?.refreshTable()
    }
    func viewDidLoad() {
        catDisplay.displayBooks { (result:Result<[Category]>) in
            switch result {
            case let .success(books):
                self.handleCategoryReceived(books)
            case let .failure(error):
                self.handleCategoryError(error)
            }
        }
    }
    
    fileprivate func handleCategoryReceived(_ cat: [Category]) {
        self.category = cat
        numberOFRow = self.category.count
        catView?.refreshTable()
    }
    
    fileprivate func handleCategoryError(_ error: Error) {
        // Here we could check the error code and display a localized error message
       catView?.didReturnWithError(error: error)
    }
    func didSelectRow(cell: UITableViewCell,index:NSIndexPath) {
        router.navigateCategoryDetailVC(cat: category[index.row])
    }
    
    func cellRowIndexPath(cell: CatTableViewCell,index:NSIndexPath) {
       
        cell.setCatName(catName:category[index.row].name!)
       // catCell.setCatImage(catImage: category[index.row].catImage!)

    }

    
}
