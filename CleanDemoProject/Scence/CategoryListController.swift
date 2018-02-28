//
//  ViewController.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import UIKit

protocol CategoryView {
    func didReturnSuccessFully(result:Any)
    func didReturnWithError(error:Error)
    func refreshTable()

}

//http://www.easyshareweb.in/play/easyshare/get_categories.php
class CategoryListController: UIViewController {
    @IBOutlet weak var catTable:UITableView!
    var presenter:CategeoryPresente?
    var configurator = CategoryConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configurationCategory(vc: self)
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension CategoryListController:CategoryView
{
    func didReturnWithError(error: Error) {
        
    }
    func didReturnSuccessFully(result: Any) {
        print("Success")
    }
    func refreshTable() {
        catTable.reloadData()
    }
}
extension CategoryListController:UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(cell: UITableViewCell(), index: indexPath as NSIndexPath)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOFRow
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndetifier = "CatTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier:cellIndetifier, for: indexPath) as! CatTableViewCell
        presenter?.cellRowIndexPath(cell:cell, index: indexPath as NSIndexPath)
        return cell
        
    }
}

