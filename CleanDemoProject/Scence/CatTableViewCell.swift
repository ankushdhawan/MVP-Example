//
//  CatTableViewCell.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 08/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import UIKit
protocol CatTableCellProtocol {
    func setCatName(catName:String) -> Void
    func setCatImage(catImage:String) -> Void
}
class CatTableViewCell: UITableViewCell,CatTableCellProtocol {
    @IBOutlet weak var catName:UILabel!
    @IBOutlet weak var catImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCatName(catName: String) {
        self.catName.text = catName
    }
    func setCatImage(catImage: String) {
       // self.catImage.image = UIImage(named:catImage)

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
