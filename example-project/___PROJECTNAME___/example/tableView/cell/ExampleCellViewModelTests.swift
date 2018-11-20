import XCTest
import ReactiveCocoa
import ReactiveSwift
import Result

@testable import ___PROJECTNAME___Framework
@testable import ___PROJECTNAME___Api

class ExampleCellViewModelTests: XCTestCase {
    
    let exampleCellViewModel = ExampleCellViewModel()
    let title = TestObserver<String, NoError>()
    
    override func setUp() {
        super.setUp()
        exampleCellViewModel.outputs.title.observe(title.observer)
    }
    
    override func tearDown() {}
    
    func testTitle() {
        exampleCellViewModel.inputs.configureWith(example: "Example")
        title.assertLastValue("Example")
        XCTAssertEqual(title.values.count, 1)
    }
}
