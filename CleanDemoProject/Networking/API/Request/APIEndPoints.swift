//
//  APIEndPoints.swift
//  TemplateProject
//
//  Created by Vishal Lohia on 4/12/17.
//  Copyright © 2017 Mobileprogramming. All rights reserved.
//

import Foundation

protocol ParameterBodyMaker {
    func httpBodyEnvelop()->Requestable?
    func encodeBodyEnvelop() throws -> Data?
}

struct CatEnvelop:Requestable  {
    var apiPath:String { return "/get_categories.php" }
    var httpType:HttpType = .get
    var bodyParams:[String:String]?
    var urlParams:[String:String]?
    let paramTypes : ServicePath?
    
}




internal enum ServicePath:ParameterBodyMaker{
    
    //case login(username:String, password:String)
    case Patient()

    case registration(username:String, email:String)
    
    func httpBodyEnvelop()->Requestable? {
        
        switch self {
           
        case .Patient():
            let obj = CatEnvelop(httpType: .get, bodyParams: nil, urlParams: nil, paramTypes: nil)
            
            return obj
            break
       // case .login(username: let user, password: let pwd):
          //  let postBody = ["username":user, "password":pwd]
            
//            let obj = LoginEnvelop(httpType: .post, bodyParams: postBody, urlParams: nil, paramTypes: self)
//            //let obj2 = LoginEnvelop(httpType: .get, bodyParams: nil, urlParams: postBody, paramTypes: self)
//            
//            return obj as Requestable?
            /* Request */
            
            /* Apply encoding */
            
       
            
            
            
            
            
        default:
            break
        }
        
        return nil
    }
    
    func encodeBodyEnvelop() throws -> Data? {
        
        do {
            
            if let body = self.httpBodyEnvelop() {
                let bodyDict = body.bodyParams
                let data = try JSONSerialization.data(withJSONObject: bodyDict!, options: .prettyPrinted)
                return data
            }
        }
        catch  {
            throw error
        }
        
        return nil
    }
}

struct APIEndPoints {
    
    
    
}
