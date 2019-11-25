//
//  NabooConfiguration.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
import MicrosoftAzureMobile

public class NabooConfiguration {
    
    public var applicationKey : String?
    public var serverBaseUrl : String?
    public var client : MSClient?
    
    public init(applicationKey : String,serverBaseUrl : String,microsoftLoginConnectorUrl : String) {
        self.applicationKey = applicationKey
        self.serverBaseUrl = serverBaseUrl
        self.client = MSClient(applicationURL: URL(string: microsoftLoginConnectorUrl)!)
    }
}
