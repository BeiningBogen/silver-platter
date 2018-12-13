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
//@testable import <YOUR_TARGET>

class ___VARIABLE_controllerIdentifier___ViewModelTests: XCTestCase {

    let viewModel = ___VARIABLE_controllerIdentifier___ViewModel()

    let title = TestObserver<String, NoError>()

    override func setUp() {
        super.setUp()

        viewModel.outputs.title.observe(title.observer)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTitleDidNotEmitValue() {
        title.assertDidNotEmitValue()
    }
}
