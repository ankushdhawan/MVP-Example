//
//  Requestable.swift
//  TemplateProject
//
//  Created by Vishal Lohia on 4/12/17.
//  Copyright © 2017 Mobileprogramming. All rights reserved.
//

import Foundation

enum HttpType:String {
    case get = "GET"
    case post = "POST"
}

protocol Requestable {
    var basePath:String? { get }
    var apiPath:String {get}
    var httpType:HttpType {get set}
    var urlParams:[String:String]? {get set}
    var bodyParams:[String:String]? {get set}
    //
    //func httpHeaders()->[String:String]?
    //    func postBodyParams()->AnyObject
    //func requestURL()->NSURL?
}

extension Requestable {
    
    
    var basePath:String? {
        return ConfigEndPoints.shared.appMode.baseEndPoint()
    }
    
    func requestURL()->NSURL? {
        if let path = self.basePath {
            
            let fullPath = path+self.apiPath
            return URL(string: fullPath) as NSURL?
            
        }
        
        return nil
    }
    
    func httpHeaders()->[String:String]? {
        
        var dict:[String:String] = [:]
        dict["Content-Type"] = "application/json"
        
        return dict
    }
    
    
}
