
//
//  Category.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
struct  Category {
    var id:String?
    var name:String?
    var catImage:String?
    init(id:String,name:String,catImage:String) {
        self.id = id
        self.catImage = catImage
        self.name = name
    }
}
