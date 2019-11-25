//
//  NabooConfiguration.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
import MicrosoftAzureMobile

class NabooConfiguration {
    
    var applicationKey : String?
    var serverBaseUrl : String?
    var client : MSClient?
    
    init(applicationKey : String,serverBaseUrl : String,microsoftLoginConnectorUrl : String) {
        self.applicationKey = applicationKey
        self.serverBaseUrl = serverBaseUrl
        self.client = MSClient(applicationURL: URL(string: microsoftLoginConnectorUrl)!)
    }
}
