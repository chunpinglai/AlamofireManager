//
//  AlamofireManager.swift
//  FireInspection
//
//  Created by AbbyLai on 2017/2/13.
//  Copyright © 2017年 AbbyLai. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireManager: NSObject {
    typealias apiSuccess = (_ result: NSDictionary) -> Void
    typealias apiFailure = (_ error: NSDictionary?) -> Void
    
    class func makeGetCall(_ strURL: String, parameters: [String: AnyObject], success:@escaping apiSuccess, failure:@escaping apiFailure) {
        Alamofire.request(strURL, parameters: parameters).responseJSON { (responseObject) -> Void in
            print("\nmakeGetCall:\n\(responseObject)")
            
            if responseObject.result.isSuccess {
                let JSON = responseObject.result.value as? NSDictionary
                if (JSON != nil) {
                    success(JSON!)
                }
                else {
                    failure(["error":"API Format Error", "statusCode":999])
                }
            }
            if responseObject.result.isFailure {
                let httpError: NSError = responseObject.result.error! as NSError
                let statusCode = httpError.code
                let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                failure(error)
            }
        }
    }
    
    class func makePostCall(_ strURL: String, parameters: [String: AnyObject], success:@escaping apiSuccess, failure:@escaping apiFailure) {
        Alamofire.request(strURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
            print("\nmakePostCall:\n\(responseObject)")
            
            if responseObject.result.isSuccess {
                let JSON = responseObject.result.value as? NSDictionary
                if (JSON != nil) {
                    success(JSON!)
                }
                else {
                    failure(["error":"API Format Error", "statusCode":999])
                }
            }
            if responseObject.result.isFailure {
                let httpError: NSError = responseObject.result.error! as NSError
                let statusCode = httpError.code
                let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                failure(error)
            }
        }
    }
}
