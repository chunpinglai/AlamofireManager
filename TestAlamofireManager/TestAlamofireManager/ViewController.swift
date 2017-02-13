//
//  ViewController.swift
//  TestAlamofireManager
//
//  Created by AbbyLai on 2017/2/13.
//  Copyright © 2017年 AbbyLai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendBtnAction(_ sender: Any) {
        //url
        let url : String = "https://your api"
        //api parameters
        let parameters: [String: String] = [
            "userId":"",
            "password":"",
            "deviceId":"test"]
        //call method
        AlamofireManager.makeGetCall(url, parameters: parameters as [String : AnyObject], success: {(result: NSDictionary) -> Void in
            print ("Api Success : result is:\n \(result)")
        }, failure: {(error: NSDictionary?) -> Void in
            print ("Api Failure : error is:\n \(error)")
        })
        
    }

}

