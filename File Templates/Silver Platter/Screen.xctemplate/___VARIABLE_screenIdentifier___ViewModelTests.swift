//
// ___FILENAME___
// ___PROJECTNAME___
//
// Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import XCTest
import ReactiveCocoa
import ReactiveSwift

class ___VARIABLE_screenIdentifier___ViewModelTests: XCTestCase {

    let viewModel = ___VARIABLE_screenIdentifier___ViewModel()

    let test = TestObserver<String, NoError>()

    override func setUp() {
        super.setUp()

        viewModel.outputs.test.observe(test.observer)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {

    }
}
