# AlamofireManager
A simple way to use Alamofire.

    let url : String = "https://your api"
    
    let parameters: [String: String] = [
        "userId":"",
        "password":""]
    
    AlamofireManager.makeGetCall(url, parameters: parameters as [String : AnyObject], success: {(result: NSDictionary) -> Void in
        print ("Api Success : result is:\n \(result)")
    }, failure: {(error: NSDictionary?) -> Void in
        print ("Api Failure : error is:\n \(error)")
    })