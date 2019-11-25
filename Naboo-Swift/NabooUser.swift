//
//  User.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
import Alamofire

public typealias CompletitionCallBack = ((_ success: Bool, _ responseObject: [String:Any]?,_ statusCode : Int?)-> ())?

public class NabooUser {
    public var userId : Float?
    public var username : String?
    
    init(dict : [String : Any]) {
        self.userId = dict["userId"] as? Float
        self.username = dict["username"] as? String
    }
    
    //MARK: MAIN FUNCTION
    private func executeRequest(request : URLRequestConvertible,completitionCallback : CompletitionCallBack) {
        Alamofire.request(request).responseJSON { (response) in
            switch response.result {
            case .success(_):
                let json = response.result.value as? [String:Any]
                completitionCallback!(true,json,200)
            case .failure(_):
                if let res = response.response {
                    let statusCode = res.statusCode
                    completitionCallback!(false,nil,statusCode)
                } else {
                    completitionCallback!(false,nil,nil)
                }
            }
        }
    }
    
    //Login
    public func login(email : String,password : String,deviceId : String,completitionHandler : CompletitionCallBack) {
        let loginParameters = [
            "Email" : email,
            "Password" : password,
            "DeviceId" : deviceId
        ]
        self.executeRequest(request: Router.LoginWithEmail(loginParameters, nil)) { (success,responseDict, statusCode) in
            completitionHandler!(success,responseDict,statusCode)
        }
    }
}

