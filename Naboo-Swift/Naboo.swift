//
//  Naboo.swift
//  Naboo-Swift
//
//  Created by Miki Dimitrov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation

// Naboo is a singlton class that have the configuration in it.
// We use  this  class to  initialize the library, and to have access to the configuration in any time during the lifetime of th e application.

public class Naboo {
    
    public static let sharedInstance = Naboo()
    
    public var nabooConfiguration : NabooConfiguration!
    
    public init() {}
    
    public init(nabooConfiguration : NabooConfiguration) {
        self.nabooConfiguration = nabooConfiguration
    }
}
