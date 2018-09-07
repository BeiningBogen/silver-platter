//
//  Service.swift
//  CFApi
//
//  Created by Håkon Bogen on 11/07/2018,28.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import SwiftyStoreKit

public struct Service : ServiceType {
    
    
    
    public let serverConfig: ServerConfigType
    
    public init(serverConfig: ServerConfig = .local) {
        self.serverConfig = serverConfig
    }
    
    public func purchaseSubscription(type: AppType) -> SignalProducer<Void, RequestableError> {
        switch type {
        case .exphil:
            SwiftyStoreKit.purchaseProduct("no.beiningbogen.exphil.abonnement", quantity: 1, atomically: true) { result in
                switch result {
                case .success(let purchase):
                    //Return void
                    print("Purchase Success: \(purchase.productId)")
                case .error(let error):
                    print(RequestableError.shopError(error: error))
                }
            }
        }

        //buy subscription
        
        //If it was successfull get void
        
        //if it was unseccusfull map requestableError
        
        
        
        return .empty

    }
    
    public func getSubject(path: Requests.GetSubjectRequestable.Path) -> SignalProducer<Requests.GetSubjectRequestable.Response, RequestableError> {
        return Requests.GetSubjectRequestable.request(serverConfig: self.serverConfig, path: path)
        
    }
}
