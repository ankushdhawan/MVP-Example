//
//  APICategory.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

//
//  APICategory.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 06/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation

struct CatResponse:Decodable {
    var status:String!
    var message:String!
    var data:[APICategory]!
}

struct APICategory:Decodable{
    var id :String!
    var name :String!
    var image :String!
    
}
extension APICategory
{
    var cat: Category {
        return Category.init(id:id,name:name,catImage:image)
        
    }
}

