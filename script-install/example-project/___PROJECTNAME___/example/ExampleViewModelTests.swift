import XCTest
import ReactiveCocoa
import ReactiveSwift
import Result

@testable import ___PROJECTNAME___Framework
@testable import ___PROJECTNAME___Api

class ExampleViewModelTests: XCTestCase {

    let exampleViewModel = ExampleViewModel()
    let goBack = TestObserver<Void, NoError>()

    override func setUp() {
        super.setUp()
        exampleViewModel.outputs.goBack.observe(goBack.observer)
    }

    override func tearDown() {}

    func testGoBack() {
        exampleViewModel.inputs.closeTapped()
        goBack.assertDidEmitValue()
    }
}
