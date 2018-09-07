//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCTest
import ReactiveCocoa
import ReactiveSwift
import Result

@testable import ___VARIABLE_productName___Framework
@testable import ___VARIABLE_productName___Api

class ExampleViewModelTests: XCTestCase {

    let exampleViewModel = ExampleViewModel()
    let goBack = TestObserver<Void, NoError>()

    override func setUp() {
        super.setUp()
        storeViewModel.outputs.goBack.observe(goBack.observer)
    }

    override func tearDown() {}

    func testGoBack() {
        storeViewModel.inputs.closeTapped()
        goBack.assertDidEmitValue()
    }
}
