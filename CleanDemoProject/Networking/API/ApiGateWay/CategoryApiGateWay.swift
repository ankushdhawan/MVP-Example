//
//  CategoryApiGateWay.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 07/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
typealias ApiFetchHandler = (_ category: Result<[Category]>) -> Void
protocol  CategoryGateWay{
    func fetchBooks(completionHandler: @escaping ApiFetchHandler)
}

protocol CategoryApiGateWay:CategoryGateWay {
}
    
    class CategoryApiGateWayImplemenation:CategoryApiGateWay  {
    
    var apiClient:ApiClient
    var request:Requestable
    init(apiClient:ApiClient,request:Requestable) {
        self.apiClient = apiClient
        self.request = request
    }
    func fetchBooks(completionHandler: @escaping ApiFetchHandler) {
        
        
        apiClient.excuteApi(request: self.request) { (result: Result<ApiResponse<CatResponse>>) in
            switch result {
            case let .success(response):
               
                
                let catBook = response.entity.data?.map({ return $0.cat
                }) as! [Category]
                completionHandler(.success(catBook))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        
     
       
        
//        self.apiClient?.excuteApi(request: self.request, handler: { (result: Result<Any>) in
//            switch result {
//            case let .success(response):
//                do
//                {
//                    let data = response as! Data
//                    let jsonDecoder = JSONDecoder()
//                    let item = try jsonDecoder.decode(CatResponse.self, from: data) as CatResponse
//                    let catBook = item.data.map({ return $0.cat
//                    })
//                    completionHandler(.success(catBook))
//
//
//                }
//                catch
//                {
//
//                }
//                break
//
//            case let .failure(error):
//                completionHandler(.failure(error))
//                break
//            }
//        })
    }
    
    
    
  
    
}

