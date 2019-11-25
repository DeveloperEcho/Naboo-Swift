//
//  Naboo.swift
//  Naboo-Swift
//
//  Created by Pero Sechkov on 11/25/19.
//  Copyright © 2019 CBoards. All rights reserved.
//

import Foundation
class Naboo {
    static let sharedInstance = Naboo()
    
    var nabooConfiguration : NabooConfiguration!
    
    init() {
        
    }
    
    init(nabooConfiguration : NabooConfiguration) {
        self.nabooConfiguration = nabooConfiguration
    }
}
