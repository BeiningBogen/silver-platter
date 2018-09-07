//
//  MockService.swift
//  CFApi
//
//  Created by Håkon Bogen on 11/07/2018,28.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

//public class LastPerformedRequest {
//    public static var request: Any?
//}


public struct MockService : ServiceType {

    
    public static var lastPerformedRequest: Any?
    
    public var purchaseSubscriptionResponse: Void?
    public var purchaseSubscriptionError: RequestableError?
    
    public var serverConfig: ServerConfigType
    
    public init(serverConfig: ServerConfigType, purchaseSubscriptionResponse: Void? = nil, purchaseSubscriptionError: RequestableError? = nil) {
        
        self.purchaseSubscriptionResponse = purchaseSubscriptionResponse
        self.purchaseSubscriptionError = purchaseSubscriptionError
        self.serverConfig = serverConfig
        
    }

}
