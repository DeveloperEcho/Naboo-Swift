//
//  Router.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case LoginWithEmail([String:Any],String?)
    case LoginWithFacebook([String:Any],String?)
    case LogoutUser([String:Any],String?)
    case LoginWithSocialConnector([String:Any],String?)
    case RefreshToken([String:Any],String?)
    case ForgotPassword([String:Any],String?)
    case ChangePassword([String:Any],String?)
    case SetPassword([String:Any],String?)
    case RegisterUser([String:Any],String?)
    case SubscribeDevice([String:Any],String?)
    case GetUserAccount([String:Any],String?)
    case UpdateUserAccount([String:Any],String?)
    case UpdateUserImage([String:Any],String?)
    case GetSocialConnectors([String:Any],String?)
    case GetUserInterests([String:Any],String?)
    case GetCountries([String:Any],String?)
    case CheckIfUserExists([String:Any],String?)
    case GetPrivacyPolicy([String:Any],String?)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .CheckIfUserExists,.GetUserAccount,.GetSocialConnectors:
            return .get
        default:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .LoginWithEmail:
            return Constants.kLoginUser
        case .LoginWithFacebook:
            return Constants.kFacebookLogin
        case .LogoutUser:
            return Constants.kLogoutUser
        case .LoginWithSocialConnector:
            return Constants.kSocialConnectorSignIn
        case .RefreshToken:
            return Constants.kRefreshToken
        case .ForgotPassword:
            return Constants.kForgotPassword
        case .ChangePassword:
            return Constants.kChangePassword
        case .SetPassword:
            return Constants.kSetPassword
        case .RegisterUser:
            return Constants.kRegisterUser
        case .SubscribeDevice:
            return Constants.kSubscribeDevice
        case .GetUserAccount:
            return Constants.kGetUserAccount
        case .UpdateUserAccount:
            return Constants.kUpdateUserAccount
        case .UpdateUserImage:
            return Constants.kUserUploadImage
        case .GetSocialConnectors:
            return Constants.kSocialConnectors
        case .GetUserInterests:
            return Constants.kUserInterests
        case .GetCountries:
            return Constants.kCountries
        case .CheckIfUserExists:
            return Constants.kCheckIfUserExists
        case .GetPrivacyPolicy:
            return Constants.kGetPrivacyPolicy
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .LoginWithEmail(let param,_):
            return param
        case .LoginWithFacebook(let param,_):
            return param
        case .LogoutUser(let param,_):
            return param
        case .LoginWithSocialConnector(let param,_):
            return param
        case .RefreshToken(let param,_):
            return param
        case .ForgotPassword(let param,_):
            return param
        case .ChangePassword(let param,_):
            return param
        case .SetPassword(let param,_):
            return param
        case .RegisterUser(let param,_):
            return param
        case .SubscribeDevice(let param,_):
            return param
        case .GetUserAccount(let param,_):
            return param
        case .UpdateUserAccount(let param,_):
            return param
        case .UpdateUserImage(let param,_):
            return param
        case .GetSocialConnectors(let param,_):
            return param
        case .GetUserInterests(let param,_):
            return param
        case .GetCountries(let param,_):
            return param
        case .CheckIfUserExists(let param,_):
            return param
        case .GetPrivacyPolicy(let param,_):
            return param
        }
    }
    
    var header : [String : String] {
        var acsToken : String?
        switch self {
        case .LogoutUser(_,let accessToken):
            acsToken = accessToken
            break
        case .RefreshToken(_,let accessToken):
            acsToken = accessToken
            break
        case .ChangePassword(_,let accessToken):
            acsToken = accessToken
            break
        case .SetPassword(_,let accessToken):
            acsToken = accessToken
            break
        case .GetUserAccount(_,let accessToken):
            acsToken = accessToken
            break
        case .UpdateUserAccount(_, let accessToken):
            acsToken = accessToken
            break
        case .UpdateUserImage(_, let accessToken):
            acsToken = accessToken
            break
        case .GetSocialConnectors(_, let accessToken):
            acsToken = accessToken
            break
        case .GetCountries(_,let accessToken):
            acsToken = accessToken
            break
        default:
            break
        }
        if let acessToken = acsToken {
            return [
                Constants.kAuthorization : String.init(format: "Bearer %@",acessToken),
                Constants.accept : Constants.applicationJson,
                Constants.contentType : Constants.applicationJson,
                Constants.apiAccessKey : Naboo.sharedInstance.nabooConfiguration.applicationKey ?? ""
            ]
        } else {
            return [
                Constants.accept : Constants.applicationJson,
                Constants.contentType : Constants.applicationJson,
                Constants.apiAccessKey : Naboo.sharedInstance.nabooConfiguration.applicationKey ?? ""
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url : URL!
        url = URL(string: Naboo.sharedInstance.nabooConfiguration.serverBaseUrl ?? "" + path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody =  try JSONSerialization.data(withJSONObject: self.parameters, options: .prettyPrinted)
        urlRequest.allHTTPHeaderFields = header
        return urlRequest
    }
    
}
