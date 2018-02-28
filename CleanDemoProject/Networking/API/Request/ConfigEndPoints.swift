//
//  ConfigEndPoints.swift
//  TemplateProject
//
//  Created by Vishal Lohia on 4/10/17.
//  Copyright © 2017 Mobileprogramming. All rights reserved.
//

import Foundation

struct ConfigEndPoints {
    
    internal enum AppEnvMode:String {
        case Undefined = "Undefined"
        case Debug = "Debug"
        case Dev = "Development"
        case Prod = "Production"
        
        func baseEndPoint()->String? {
            
            switch self {
            case .Debug, .Dev:
                return "http://www.easyshareweb.in/play/easyshare"
            case .Prod:
                return "http://www.easyshareweb.in/play/easyshare"
            default:
                return "http://www.easyshareweb.in/play/easyshare"
            }
        }
    }
    
    private var mode: AppEnvMode?
    static var shared = ConfigEndPoints()
    
    var appMode:AppEnvMode {
        get {
            return  ConfigEndPoints.AppEnvMode(rawValue: "Development")!  //mode!
        }
    }
    
    mutating func initialize() {
        self.mode = .Undefined
        
        if let modeString = Bundle.main.infoDictionary?["APP_ENV"] as? String,
            let modeType = AppEnvMode(rawValue: modeString) {
            self.mode = modeType
        }
    }
}

