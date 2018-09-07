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

    public func getSubject(path: Requests.GetSubjectRequestable.Path) -> SignalProducer<Requests.GetSubjectRequestable.Response, RequestableError> {
        return Requests.GetSubjectRequestable.request(serverConfig: self.serverConfig, path: path)

    }
}
