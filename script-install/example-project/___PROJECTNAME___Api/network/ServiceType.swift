//
//  ServiceType.swift
//  CFApi
//
//  Created by Håkon Bogen on 11/07/2018,28.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

public enum AppType {
    case exphil
}

public protocol ServiceType {
    
    var serverConfig: ServerConfigType { get }
    

    func getSubject(path: Requests.GetSubjectRequestable.Path) -> SignalProducer<Requests.GetSubjectRequestable.Response, RequestableError>
    func purchaseSubscription(type: AppType) -> SignalProducer<Void, RequestableError>
    
}
