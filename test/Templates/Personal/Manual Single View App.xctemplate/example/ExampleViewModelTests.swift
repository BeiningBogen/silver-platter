//
//  StoreViewModelTests.swift
//  ChesterfieldTests
//
//  Created by Simen Fonnes on 09.08.2018.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import XCTest
import ReactiveCocoa
import ReactiveSwift
import Result

@testable import ChesterfieldFramework
@testable import CFApi

class StoreViewModelTests: XCTestCase {
    
    let storeViewModel = StoreViewModel()
    
    let goBack = TestObserver<Void, NoError>()
    let restore = TestObserver<Void, NoError>()
    let shouldShowSpinner = TestObserver<Bool, NoError>()
    let showConfirmation = TestObserver<Void, NoError>()
    let showError = TestObserver<RequestableError, NoError>()
    let showSuccess = TestObserver<Void, NoError>()

    override func setUp() {
        storeViewModel.outputs.goBack.observe(goBack.observer)
        storeViewModel.outputs.restore.observe(restore.observer)
        storeViewModel.outputs.shouldShowSpinner.observe(shouldShowSpinner.observer)
        storeViewModel.outputs.showConfirmation.observe(showConfirmation.observer)
        storeViewModel.outputs.showError.observe(showError.observer)
        storeViewModel.outputs.showSuccess.observe(showSuccess.observer)
    }

    override func tearDown() {}

    func testGoBack() {
        storeViewModel.inputs.closeTapped()
        goBack.assertDidEmitValue()
    }
    
    func testRestoreSubscription() {
        storeViewModel.inputs.restoreTapped()
        restore.assertDidEmitValue()
    }
    
    func testShowConfirmation() {
        storeViewModel.inputs.buyTapped()
        showConfirmation.assertDidEmitValue()
    }
    
    func testShouldShowSpinner() {
        let mockService = MockService.init(serverConfig: ServerConfig.template, purchaseSubscriptionResponse: (), purchaseSubscriptionError: nil)
        
        asyncServiceTest(service: mockService) { expectation in
            storeViewModel.inputs.buyTapped()
            storeViewModel.inputs.purchaseSubscriptionTapped()
            shouldShowSpinner.assertLastValue(true)
            
            delay(1) {
                self.shouldShowSpinner.assertLastValue(false)
                expectation.fulfill()
            }
        }
    }
    
    func testShowError() {
        let error = RequestableError.logicError(description: "Bad logic!")
        let mockService = MockService.init(serverConfig: ServerConfig.template, purchaseSubscriptionResponse: nil, purchaseSubscriptionError: error)
        
        asyncServiceTest(service: mockService) { expectation in
            storeViewModel.inputs.buyTapped()
            storeViewModel.inputs.purchaseSubscriptionTapped()
            
            delay(1, closure: {
                self.showError.assertDidEmitValue()
                expectation.fulfill()
            })
        }
    }
    
    func testShowSuccess() {
        let mockService = MockService.init(serverConfig: ServerConfig.template, purchaseSubscriptionResponse: (), purchaseSubscriptionError: nil)
        
        asyncServiceTest(service: mockService) { expectation in
            storeViewModel.inputs.buyTapped()
            showConfirmation.assertDidEmitValue()
            storeViewModel.inputs.purchaseSubscriptionTapped()
            
            delay(1, closure: {
                self.showSuccess.assertDidEmitValue()
                expectation.fulfill()
            })
        }
    }
}
