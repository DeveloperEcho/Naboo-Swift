//
//  NabooConfiguration.swift
//  Naboo-Swift
//
//  Created by Miki Dimitrov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
import MicrosoftAzureMobile

//          This is a configuration for the naboo library
//          This configuration have a:
//                - applicationKey : ID for the application that is using this Naboo library
//                - ServerBaseURL : Base url for the API that will be using NABOO|
//                - Client : MSCLient that will be used for social connectors Login with Microsoft  azure framework.
//                           This client is initialized with connectorUrl

public class NabooConfiguration {
    
    public var applicationKey : String!
    public var serverBaseUrl : String!
    public var client : MSClient?
    
    public init(applicationKey : String,serverBaseUrl : String,microsoftLoginConnectorUrl : String) {
        self.applicationKey = applicationKey
        self.serverBaseUrl = serverBaseUrl
        self.client = MSClient(applicationURL: URL(string: microsoftLoginConnectorUrl)!)
    }
}
