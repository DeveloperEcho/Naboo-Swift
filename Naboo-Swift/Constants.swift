//
//  Constants.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation

struct Constants {
    static let contentType = "Content-Type"
    
    static let applicationJson = "application/json"
    
    static let accept = "Accept"
    
    static let apiAccessKey = "APIAccessKey"
    
    static let kAuthorization  = "Authorization"
    
    static let kMobileToken = "MOBILE-SERVICE-AUTH-TOKEN"
    
    //User Authentication Endpoints
    static let kLoginUser = "LoginUser"
    static let kLogoutUser = "LogoutUser"
    static let kRefreshToken = "RefreshToken"
    static let kSocialConnectorSignIn = "SocialConnectorSignin"
    static let kFacebookLogin = "FacebookSignin"
    
    //Password Endpoints
    static let kForgotPassword = "ForgotPassword"
    static let kChangePassword = "ChangePassword"
    static let kSetPassword = "SetPassword"
    
    //User Account
    static let kGetUserAccount = "GetUserAccount"
    static let kUpdateUserAccount = "UpdateUserAccount"
    static let kUserUploadImage = "UserUploadImage"
    
    //Registration Enpoints
    static let kRegisterUser = "RegisterUser"
    static let kSubscribeDevice = "SubscribeDevice"
    
    //Additional Data Endpoints
    static let kSocialConnectors = "SocialConnectors"
    static let kUserInterests = "UserInterests"
    static let kCountries = "Countries"
    
    static let kCheckIfUserExists = "SocialConnectorCheckIfUserExists"
    static let kGetPrivacyPolicy = "GetPrivacyPolicy"
    
    //Default error message
    static let kDefaultErrorMessage = "An error occured, please try again later"
}
