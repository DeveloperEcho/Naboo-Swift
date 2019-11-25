//
//  Naboo.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation

public class Naboo {
    public static let sharedInstance = Naboo()
    
    public var nabooConfiguration : NabooConfiguration!
    
    public init() {
        
    }
    
    public init(nabooConfiguration : NabooConfiguration) {
        self.nabooConfiguration = nabooConfiguration
    }
}
