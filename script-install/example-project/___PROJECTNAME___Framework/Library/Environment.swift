//
//  Environment].swift
//  CFApi
//
//  Created by Håkon Bogen on 14/07/2018,28.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import Foundation
import ___PROJECTNAME___Api

public struct Environment {
    
    // Endpoint towards
    public let apiService: ServiceType

    /// The amount of time to delay API requests by. Used primarily for testing. Default value is `0.0`.
    public let apiDelayInterval: DispatchTimeInterval

    public init(apiService: ServiceType = Service(), apiDelayInterval: DispatchTimeInterval = .seconds(0)) {

        self.apiService = apiService
        self.apiDelayInterval = apiDelayInterval

    }

}
