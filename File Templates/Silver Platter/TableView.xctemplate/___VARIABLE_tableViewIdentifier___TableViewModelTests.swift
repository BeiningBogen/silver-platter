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

@testable import ___PROJECTNAME___Framework
@testable import ___PROJECTNAME___Api

class ___VARIABLE_tableViewIdentifier___ViewModelTests: XCTestCase {

    let viewModel = ___VARIABLE_tableViewIdentifier___TableViewModel()
    let goBack = TestObserver<Void, NoError>()

    override func setUp() {
        super.setUp()
        viewModel.outputs.goBack.observe(goBack.observer)
    }

    override func tearDown() {}

    func testGoBack() {
        viewModel.inputs.closeTapped()
        goBack.assertDidEmitValue()
    }
}
