//
//  AppEnvironment.swift
//  CFApi
//
//  Created by Håkon Bogen on 14/07/2018,28.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import Foundation
import ___PROJECTNAME___Api

public struct AppEnvironment {
    
    fileprivate static var stack: [Environment] = [Environment()]
    public static var current : Environment {
        return stack.last!
    }
    
    public static func pushEnvironment(environment: Environment) {
        stack.append(environment)
    }
    
    static func popEnvironment() {
        _ = stack.popLast()
    }
    
}
