//
//  User.swift
//  Naboo-Swift
//
//  Created by Miki Dimitrov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
import Alamofire
import MicrosoftAzureMobile

public typealias CompletitionCallBack = ((_ success: Bool, _ responseObject: [String:Any]?,_ statusCode : Int?)-> ())?
public typealias SocialConnectorCallBack = ((_ success: Bool,_ token : String?)-> ())?

public class NabooUser {
    public var userId : Float?
    public var username : String?
    
    public init(dict : [String : Any]) {
        self.userId = dict["userId"] as? Float
        self.username = dict["username"] as? String
    }
    
    //MARK: MAIN FUNCTION
    public func executeRequest(request : URLRequestConvertible,completitionCallback : CompletitionCallBack) {
        Alamofire.request(request).responseJSON { (response) in
            switch response.result {
            case .success:
                let statusCode = response.response?.statusCode
                let json = response.result.value as? [String: Any]
                if (statusCode == 200) {
                    completitionCallback!(true,json,200)
                } else {
                    completitionCallback!(false,json,statusCode)
                }
            case .failure:
                completitionCallback!(false,nil,nil)
            }
        }
    }
    
    //MARK: Login with email
    public func login(email : String,password : String,deviceId : String,completitionHandler : CompletitionCallBack) {
        let loginParameters = [
            "Email" : email,
            "Password" : password,
            "DeviceId" : deviceId
        ]
        print(loginParameters)
        self.executeRequest(request: Router.LoginWithEmail(loginParameters, nil)) { (success,responseDict, statusCode) in
            completitionHandler!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Login with facebook
    public func loginWithFacebook(dict : [String : Any],completitionHandler : CompletitionCallBack) {
        print(dict)
        self.executeRequest(request: Router.LoginWithFacebook(dict, nil)) { (success,responseDict, statusCode) in
            completitionHandler!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Logout user
    public func logout(accessToken : String,completitionHandler : CompletitionCallBack) {
        self.executeRequest(request: Router.LogoutUser([:], accessToken)) { (success, responseDict, statusCode) in
            completitionHandler!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Connect with social connector
    public func connectWithSocialConnector(socialConnector : String,urlScheme : String,controller : UIViewController,completitionCallback : SocialConnectorCallBack) {
        let client = Naboo.sharedInstance.nabooConfiguration.client
        client?.login(withProvider: socialConnector, urlScheme: urlScheme, controller: controller, animated: true, completion: { (user, error) in
            if (error != nil) {
                completitionCallback!(false,nil)
            } else {
                client?.currentUser = user
                completitionCallback!(true,client?.currentUser?.mobileServiceAuthenticationToken)
            }
        })
    }
    
    //MARK: Login with social connector
    public func loginWithSocialConnector(authToken  : String,dict : [String : Any],completitionCallback : CompletitionCallBack) {
        self.executeRequest(request: Router.LoginWithSocialConnector(dict, authToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Refresh Token
    public func refreshToken(refreshToken : String,deviceId : String,completitionCallback : CompletitionCallBack) {
        let parameters = [
            "RefreshToken" : refreshToken,
            "DeviceId" : deviceId
        ]
        self.executeRequest(request: Router.RefreshToken(parameters, nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Password Operations
    public func forgotPassword(email : String,completitionCallback : CompletitionCallBack) {
        let parameters = [
            "Email" : email
        ]
        self.executeRequest(request: Router.ForgotPassword(parameters, nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    public func changePassword(newPassword : String,oldPassword : String,accessToken : String,completitionCallback : CompletitionCallBack) {
        let parameters = [
            "OldPassword" : oldPassword,
            "NewPassword" : newPassword
        ]
        self.executeRequest(request: Router.ChangePassword(parameters,accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    public func setPassword(password : String,accessToken : String,completitionCallback : CompletitionCallBack) {
        let parameters = ["Password" : password]
        self.executeRequest(request: Router.SetPassword(parameters, accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Register Operations
    public func registerUser(dict : [String:Any],completitionCallback : CompletitionCallBack) {
        self.executeRequest(request: Router.RegisterUser(dict,nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    public func subscribeDevice(dict : [String:Any],completitionCallback : CompletitionCallBack) {
        self.executeRequest(request: Router.SubscribeDevice(dict,nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Get User
    public func getUserAccount(accessToken : String,completitionCallback : CompletitionCallBack) {
        self.executeRequest(request: Router.GetUserAccount(accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Update User
    public func updateUserAccount(dict : [String:Any],accessToken : String,completitionCallback : CompletitionCallBack) {
        self.executeRequest(request: Router.UpdateUserAccount(dict, accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Update User Image
    public func updateUserImage(base64String : String,accessToken : String,completitionCallback : CompletitionCallBack) {
        let parameters = ["ImageBase64Data":base64String]
        self.executeRequest(request: Router.UpdateUserImage(parameters, accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Get Social Connectors
    public func getSocialConnectors(accessToken : String?,completitionCallback : CompletitionCallBack) {
        self.executeRequest(request: Router.GetSocialConnectors([:], accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Get User Interests
    public func getUserInterests(searchValue : String,completitionCallback : CompletitionCallBack) {
        let parameters = ["SearchValue" : searchValue]
        self.executeRequest(request: Router.GetUserInterests(parameters,nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Get Countries
    public func getCountries(searchValue : String,accessToken : String,completitionCallback : CompletitionCallBack) {
        let parameters = ["SearchValue" : searchValue]
        self.executeRequest(request: Router.GetCountries(parameters, accessToken))  { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Get Privacy Policy
    public func getPrivacyPolicy(version : Int,completitionCallback : CompletitionCallBack) {
        let parameters = ["Version":version]
        self.executeRequest(request: Router.GetPrivacyPolicy(parameters,nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Get TERMS OF USE
    public func getTermsOfUse(version : Int,completitionCallback : CompletitionCallBack) {
        let parameters = ["Version":version]
        self.executeRequest(request: Router.GetTermsOfUse(parameters,nil)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
    
    //MARK: Change Email
    public func changeEmail(email: String,accessToken: String, completitionCallback : CompletitionCallBack) {
        let parameters = ["Email":email]
        self.executeRequest(request: Router.ChangeEmail(parameters, accessToken)) { (success,responseDict, statusCode) in
            completitionCallback!(success,responseDict,statusCode)
        }
    }
}
