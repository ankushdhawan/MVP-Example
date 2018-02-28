//
//  ApiClient.swift
//  CleanDemoProject
//
//  Created by Ankush Dhawan on 07/02/18.
//  Copyright © 2018 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit
protocol ApiClient {
    func excuteApi<T>(request:Requestable,handler:  @escaping (_ result: Result<ApiResponse<T>>) -> Void)
}
class ApiClientImplentation:ApiClient
{
   
    
    var session:URLSession
    
    init(session:URLSession) {
        self.session = session
    }
    func excuteApi<T>(request:Requestable,handler: @escaping (Result<ApiResponse<T>>) -> Void)
    {
        var urlrequest = URLRequest(url: request.requestURL()! as URL)
        urlrequest.httpMethod = request.httpType.rawValue
        
   let dataTask  =   session.dataTask(with: urlrequest) { (data,response,error) in
            let successRange = 200...299
           guard let responseVal = response as? HTTPURLResponse else
            {
                return
            }
            if successRange.contains(responseVal.statusCode)
            {
                do {
                    let response = try ApiResponse<T>(data: data, httpUrlResponse: responseVal)
                    handler(.success(response))
                } catch {
                    handler(.failure(error))
                }
                

            }
            else
            {
                handler(.failure(error!))
            }

        }
        dataTask.resume()
    }
}
